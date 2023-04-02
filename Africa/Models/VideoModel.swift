//
//  VideoModel.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 02/04/2023.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    // Computed property

    var thumbnails: String {
        "video-\(id)"
    }
}
