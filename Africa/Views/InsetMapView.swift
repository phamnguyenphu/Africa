//
//  InsetMapView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 31/03/2023.
//

import MapKit
import SwiftUI

struct InsetMapView: View {
    // MARK: - PROPERTY
    
    @State private var region = MKCoordinateRegion(center: .init(latitude: 6.60028, longitude: 16.4377599), span: .init(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // MARK: - BODY
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(alignment: .topTrailing, content: {
                NavigationLink {
                    MapView()
                } label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    } //: HSTACK
                    .padding(.horizontal, 10)
                    .padding(.vertical, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                } //: NAVIGATION LINK
                .padding(8)
            })
            .frame(height: 256)
            .cornerRadius(12)
    }
}

// MARK: - PREVIEW

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
