//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 03/04/2023.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    // MARK: - PROPERTY

    var videoSelected: String
    var videoTitle: String

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            VStack {
                VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                    // Text(videoTitle)
                }
                .overlay(alignment: .topLeading) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                }
            }
            .navigationTitle(videoTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - PREVIEW

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
