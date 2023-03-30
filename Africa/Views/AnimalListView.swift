//
//  AnimalListView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 31/03/2023.
//

import SwiftUI

struct AnimalListView: View {
    // MARK: - PROPERTY

    let animals: [Animal] = Bundle.main.decode("animals.json")

    // MARK: - BODY

    var body: some View {
        VStack(spacing: 20) {
            ForEach(animals) { item in
                AnimalListItemView(animal: item)
            }
        }
        .padding(.vertical, 10)
    }
}

struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListView()
    }
}
