//
//  MapLocation.swift
//  MapLoc
//
//  Created by tom montgomery on 8/16/23.
//

import UIKit
import CoreLocation
//required for CLLocation stuff

// don't really need a class, just use a struct
struct MapLocation: Identifiable {
    
    // must have UUID to be Identifiable
    let id = UUID()
    // basic reqs for ANNOTATION is just the coords
    let name: String
    let latitude: Double
    let longitude: Double
    
    // computed property - must be var, not let
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
// not always feasible to have a name.  don't always know what's at the pin
let MapLocations = [
    MapLocation(name: "St Francis Memorial Hospital", latitude: 37.789467, longitude: -122.416772),
    MapLocation(name: "The Ritz-Carlton, San Francisco", latitude: 37.791965, longitude: -122.406903),
    MapLocation(name: "Honey Honey Cafe & Crepery", latitude: 37.787891, longitude: -122.411223)
]
