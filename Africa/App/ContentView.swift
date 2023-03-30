//
//  ContentView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        } detail: {
            EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
