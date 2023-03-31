//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 31/03/2023.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - PROPERTY

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()

                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            } //: HSTACK
        } //: GROUP BOX
    }
}

// MAKR: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animal[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
