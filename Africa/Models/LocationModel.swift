//
//  LocationModel.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 03/04/2023.
//

import MapKit
import SwiftUI

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double

    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
