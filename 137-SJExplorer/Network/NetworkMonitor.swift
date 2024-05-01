//
//  NetworkMonitor.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 4/24/24.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    
    let queue = DispatchQueue(label: "NetworkManager")
    let monitor = NWPathMonitor()
    
    @Published var isConnected = true
    
    var imageName: String {
        return isConnected ? "wifi" : "wifi.slash"
    }
    var connectionDescription: String {
        if isConnected {
            return "Connected to the Internet"
        } else {
            return "Cannot Connect to the Internet"
        }
    }
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
    
    
    
}
