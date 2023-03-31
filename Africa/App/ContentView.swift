//
//  ContentView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY

    let animals: [Animal] = Bundle.main.decode("animals.json")

    // MARK: - BODY

    var body: some View {
        NavigationSplitView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))

                ForEach(animals) { item in
                    NavigationLink {
                        AnimalDetailView(animal: item)
                    } label: {
                        AnimalListItemView(animal: item)
                    } //: NAVIGION LINK
                    .padding(.vertical, 4)
                } //: FOREACH LOOP
            } //: LIST
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            EmptyView()
        } //: NAVIGATION SPLIT VIEW
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
