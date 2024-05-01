//
//  SwiftUIView.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 4/4/24.
//

import SwiftUI
import MapKit


struct Maps: View {
    let cBlue = Color(hex: 0x7C9CD4, alpha: 0.6)
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @ObservedObject var locationManager = LocationManager.shared
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    @State var selected: MKMapItem?
    @State var selec: Int?
    @State private var showDetails = false
    
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                RequestLocation()
            } else {
                Map(position: $cameraPosition, selection: $selected) {
                    Annotation("MLK Library", coordinate: .mlkLib) {
                        ZStack{
                            Image(.mlkPic)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(5)
                                .foregroundStyle(.white)
                                .background{
                                    Circle()
                                        .frame(width: 55, height: 55)
                                        .foregroundStyle(cBlue)
                                }                        }
                    }.tag(1)
                    
                    Annotation("Engineering Building", coordinate: .engrB) {
                        ZStack{
                            Image(.engineering)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(5)
                                .foregroundStyle(.white)
                                .background{
                                    Circle()
                                        .frame(width: 55, height: 55)
                                        .foregroundStyle(cBlue)
                                }
                        }
                    }.tag(2)
                    
                    Annotation("Dining Commons", coordinate: .dc) {
                        ZStack{
                            Image(.dcPic)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(5)
                                .foregroundStyle(.white)
                                .background{
                                    Circle()
                                        .frame(width: 55, height: 55)
                                        .foregroundStyle(cBlue)
                                }
                        }
                    }.tag(3)
                    UserAnnotation()
                }
                .mapControls {
                    MapCompass()
                    MapPitchToggle()
                    MapUserLocationButton()
                }
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static var sjsuLocation: CLLocationCoordinate2D {
        return .init(latitude: 37.3352, longitude: -121.8811)
    }
    
    static var mlkLib: CLLocationCoordinate2D {
        return .init(latitude: 37.33552, longitude: -121.88483)
    }
    
    static var engrB: CLLocationCoordinate2D {
        return .init(latitude: 37.337427426151244, longitude: -121.88106836635795)
    }
    static var dc: CLLocationCoordinate2D {
        return .init(latitude: 37.3341526784227, longitude: -121.87850703929325)
    }
    
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .sjsuLocation, latitudinalMeters: 815, longitudinalMeters: 815)
    }
}


#Preview {
    Maps()
}
