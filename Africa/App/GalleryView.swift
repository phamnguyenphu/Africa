//
//  GalleryView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 30/03/2023.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTY
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    // EFFICIENT GRID DEFINITION
    //    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID DEFINITION
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color.white, lineWidth: 8)
                    }
                
                // MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2 ... 4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { _ in
                        gridSwitch()
                    }
                
                // MARK: - GRID
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 20, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                            }
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    selectedAnimal = item.image
                                    haptics.impactOccurred()
                                }
                            }
                    } //: FOREACH LOOP
                }) //: LazyVGrid
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
                .onAppear {
                    gridSwitch()
                }
            } //: VSTACK
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            MotionAnimationView()
        }
    }
}

// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
