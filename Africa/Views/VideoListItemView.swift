//
//  VideoListItemView.swift
//  Africa
//
//  Created by Pham Nguyen Phu on 02/04/2023.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTY
    
    let video: Video
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnails)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZSTACK
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VSTACK
        } //: HSTACK
        .padding(.vertical, 8)
    }
}

// MARK: - PREIVEW

struct VideoListItemView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
