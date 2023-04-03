//
//  MapView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 30/03/2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    // MARK: - PROPERTY
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - 1. BASIC MAP
        
        //        Map(coordinateRegion: $region)
        
        // MARK: - 2. ADVANCE MAP
        
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) Marker: new style (always static)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (B) custom basic annotation (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } //: ANNOTATION
        }
    }
}

// MARK: - PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
