//
//  SwiftUIView.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 4/4/24.
//

import SwiftUI
import MapKit


struct SwiftUIView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    
    
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                RequestLocation()
            } else {
                Map(position: $cameraPosition) {
                   Marker("My location", systemImage: "paperplane", coordinate: .userLocation)
                    .tint(.blue)
                    
                    
                }
                .mapControls {
                    MapCompass()
                }
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 25.7602, longitude: -80.1959)
    }
    
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}


#Preview {
    SwiftUIView()
}
