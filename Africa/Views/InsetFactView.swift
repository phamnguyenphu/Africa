//
//  InsetFactView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 31/03/2023.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTY

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                        .fontWeight(.medium)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GROUP BOX
    }
}

// MARK: - PREVIEW

struct InsetFactView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
