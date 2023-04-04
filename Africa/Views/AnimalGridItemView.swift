//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 04/04/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
            .padding(.horizontal, 8)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animal[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
