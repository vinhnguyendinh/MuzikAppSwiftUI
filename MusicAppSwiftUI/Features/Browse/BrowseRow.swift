//
//  BrowseRow.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct BrowseRow: View {
    var imageSongUrl: String
    var songName: String
    var singerName: String
    var downloadUrl: String
    
    var imageWidth: CGFloat = 85
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            self.createImageView()
            self.createSongView()
            Spacer()
            self.createGetButton()
        }
    }
    
    private func createImageView() -> some View {
        return URLImageView(url: self.imageSongUrl)
            .scaledToFill()
            .frame(width: self.imageWidth, height: self.imageWidth)
            .cornerRadius(5)
            .padding(.trailing, 10)
    }
    
    private func createSongView() -> some View {
        return VStack(alignment: .leading) {
            Text(self.songName)
                .font(.callout)
                .padding(.bottom, 10)
                .lineLimit(nil)
            
            Text(self.singerName)
                .font(.caption)
                .lineLimit(nil)
        }
    }
    
    private func createGetButton() -> some View {
        return Button(action: {
            
        }) {
            Text("Get")
                .font(.headline)
                .frame(width: 80, height: 30)
                .foregroundColor(.white)
                .background(Color.pinkColor)
                .cornerRadius(15)
        }
    }
}

struct BrowseRow_Previews: PreviewProvider {
    static var previews: some View {
        BrowseRow(imageSongUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80",
                  songName: "The Troopers",
                  singerName: "Iron Maiden",
                  downloadUrl: "")
    }
}
