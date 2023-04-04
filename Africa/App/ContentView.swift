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
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func swithGrid() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridLayout.count % 3 + 1))
        gridColumn = gridLayout.count
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationSplitView {
            Group {
                if !isGridViewActive {
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
                }
                else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 16) {
                            ForEach(animals) { item in
                                NavigationLink {
                                    AnimalDetailView(animal: item)
                                } label: {
                                    AnimalGridItemView(animal: item)
                                } //: NAVIGION LINK
                            }
                        }
                    }
                }
            } //: GROUP
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST ITEM
                        Button {
                            withAnimation(.easeIn(duration: 0.25)) {
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // GRID
                        Button {
                            withAnimation(.easeInOut(duration: 0.75)) {
                                isGridViewActive = true
                                haptics.impactOccurred()
                                swithGrid()
                            }
                            
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    } //: HSTACK
                }
            } //: TOOLBAR
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
