//
//  ContentView.swift
//  MapLoc
//
//  Created by tom montgomery on 8/8/23.
//

import SwiftUI
import MapKit
// render maps, call out points of interest

struct ContentView: View {
    
    // Since coordinateRegion is BINDING it should be a State var
    
    // CLLocationCoordinate2D is just a lat/long
    // STATIC REGION
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.789, longitude: -122.416), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    // it must be binding b/c the state needs to change.  you might scroll it, pan it, zoom it, etc.
    // lat/long delta is how zoomed in are we?
    // ideal delta is .1 to .5 for moderate zoom
    // old syntax - now it uses the Make version
    
    //@State var region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.789, -122.416), MKCoordinateSpanMake(0.1, 0.1))
    
    // LOCATION BASED (DYNAMIC) REGION
    // StateObject instantiates an observable object - needs to be b/c we created a custom class
    @StateObject var userRegion = LocationManager()
    
    @State var tracking = MapUserTrackingMode.follow
    
    var body: some View {
        // Most basic map - coordinateRegion
        //Map(coordinateRegion: $region)
        // .1 delta gives downtown san francisco
        // .5 delta gives the entire bay area
        
        
        // use userRegion.region instead of $region because it's a prop
        Map(coordinateRegion: $userRegion.region, interactionModes: MapInteractionModes.all, showsUserLocation: true, userTrackingMode: $tracking)
        // interactionModes: MapInteractionModes.pan , zoom
        // showsUserLocation true still won't show until we have a user location allowed/avail
        /// must add 'Privacy - when in use' and a description in info.plist to make it work right
        // userTrackingMode needs a binding
        
        // LocationManager - legacy
        // New File > Cocoa Touch class > subclass of NSObject >> LocationManager
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
