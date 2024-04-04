//
//  LocationManager.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 4/4/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
            
        case .notDetermined:
            print("DEBUG: test1")
        case .restricted:
            print("DEBUG: test2")
        case .denied:
            print("DEBUG: test3")
        case .authorizedAlways:
            print("DEBUG: Denied")
        case .authorizedWhenInUse:
            print("DEBUG: Auth always")
        @unknown default:
            print("DEBUG: Auth when in use")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}
