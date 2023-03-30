//
//  CoverImageView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 30/03/2023.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTY

    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    // MARK: - BODY

    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: FOREACH LOOP
        } //: TABVIEW
        .tabViewStyle(.page)
    }
}

// MARK: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
