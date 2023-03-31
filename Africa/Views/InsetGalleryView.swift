//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 31/03/2023.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - PROPERTY

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } //: FOREACH LOOP
            } //: HSTACK
        } //: SCROLL VIEW
    }
}

// MARK: - PREVIEW

struct InsetGalleryView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
