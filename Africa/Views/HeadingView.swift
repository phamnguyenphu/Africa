//
//  HeadingView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 31/03/2023.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTY

    let headerImage: String
    let headerName: String

    // MARK: - BODY

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: headerImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headerName)
                .font(.title3)
                .fontWeight(.bold)
        } //: HSTACK
        .padding(.vertical)
    }
}

// MARK: - PREVIEW

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headerImage: "photo.on.rectangle.angled", headerName: "Wilderness in Picture")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
