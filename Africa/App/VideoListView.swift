//
//  VideoListView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 30/03/2023.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTY

    @State var videos: [Video] = Bundle.main.decode("videos.json")

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { video in
                    VideoListItemView(video: video)
                } // FOR EACH LOOP
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Shuffle Videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //: NAVIGATION STACK
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
