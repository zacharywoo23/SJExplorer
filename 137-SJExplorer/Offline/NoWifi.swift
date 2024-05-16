//
//  NoWifi.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 5/1/24.
//

import SwiftUI

struct NoWifi: View {
    @ObservedObject var networkManager = NetworkMonitor()
    
    @State private var failedAttemptConnect = false
    let cBlue = Color(hex: 0x7C9CD4, alpha: 0.6)
    let cBlue2 = Color(hex: 0x7C9CD4, alpha: 1.0)
    let cWhite = Color(hex: 0xF2F5FB, alpha: 1.0)
    var body: some View {
        NavigationView {
            ZStack {
                Color(cBlue).ignoresSafeArea()
                
                VStack {
                    Image(systemName: "wifi.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(cWhite)
                    
                    Text("Not connected to the internet")
                        .font(.system(size: 28))
                        .padding()
                        .foregroundColor(cWhite)
                    
                   
                    NavigationLink(destination: HomeTabs()) {
                        
                        Text("Use offline")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(cBlue2))
                    }
                    .navigationBarBackButtonHidden(true)
                    .frame(width: 140)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                    Button("Retry") {
                        if (!networkManager.isConnected) {
                            failedAttemptConnect=true
                                
                        }  else {
                            failedAttemptConnect=false
                        }
                        
                    }
                    .foregroundColor(Color(cBlue2))
                    .navigationBarBackButtonHidden(true)
                    .frame(width: 140, height: 50)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
                    if (failedAttemptConnect){
                        Text("Unable to connect")
                            .foregroundStyle(.red)
                            .font(.system(size: 20))
                    }
                    
                    
                    Image(.logo).resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 32)
                        .grayscale(1.0)
                }
            }
        }
        
    }
}

#Preview {
    NoWifi()
}
