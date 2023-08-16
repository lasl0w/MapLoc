//
//  LocationManager.swift
//  MapLoc
//
//  Created by tom montgomery on 8/15/23.
//

import UIKit
import CoreLocation // needed for LocManDelegate
import MapKit

// Need to conform to LocManDelegate to recieve events
// Need ObservableObject b/c it needs to be binding, updating the view when data updates
class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    // instantiate blank, published coordinate region with lat/long
    @Published var region = MKCoordinateRegion()
    // instantiate blank, location manager
    private let manager = CLLocationManager()
    
    override init() {
        // TODO: always call super when subclassing NSOBJECT?
        super.init()
        // set "THIS specific" CLLocationManager as the delegate
        manager.delegate = self
        // dynamic - best available
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    // automatically runs - AGAIN AND AGAIN! - telling the delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // get the last location and map it (in order to save it)
        locations.last.map {
            // hash map - $0 is the locations.last entry
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude:
                    $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                )
        }
    }
    
}
