//
//  NowPlayingView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct NowPlayingView: View {
    @State var playbackMode: PlaybackMode = .normal
    
    @State var isPlaying: Bool = false
    
    @State var volume: Double = 1
    
    @State var sliderValue: Double = 0
    var time: Double
    
    var songImageUrl: String
    
    var songName: String
    var singerName: String
    
    var songUrl: String
    
    var body: some View {
        ZStack {
            self.createBackgroundBlurImage()
            
            VStack(alignment: .center, spacing: 0) {
                ProfileImageView(url: self.songImageUrl)
                
                NowPlayingDetailView(songName: self.songName, singerName: self.singerName)
                
                SeekBarView(time: self.time, sliderValue: $sliderValue)
                    .padding([.top, .bottom], 10)
                
                ControlsView(playbackMode: $playbackMode, isPlaying: $isPlaying, volume: $volume, shuffleHandler: {}, repeatHandler: {}, prevHandler: {}, playHandler: {}, nextHandler: {})
            }.padding()
        }
    }
    
    private func createBackgroundBlurImage() -> some View {
        URLImageView(url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80")
            .frame(width: 300, height: 300)
            .blur(radius: 40)
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView(time: 100, songImageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80", songName: "Inis Mona - Eluveiti", singerName: "Eluveitie", songUrl: "https://itunes.apple.com/us/album/something-for-the-pain/900032785?i=900032829")
        
    }
}
