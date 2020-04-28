//
//  NowPlayingView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI
import AVFoundation

struct NowPlayingView: View {
    @State var playbackMode: PlaybackMode = .normal
    @State var isPlaying: Bool = false
    @State var volume: Double = 1
    
    @State var currentTime: TimeInterval = 0
    var currentDuration: TimeInterval
    
    var songImageUrl: String
    
    var songName: String
    var singerName: String
    
    var songUrl: String
    
    var body: some View {
        ZStack {
            self.createBackgroundBlurImage()
            self.createPlayingView()
        }
    }
    
    private func createPlayingView() -> some View {
        return VStack(alignment: .center, spacing: 0) {
            ProfileImageView(url: self.songImageUrl)
            
            NowPlayingDetailView(songName: self.songName, singerName: self.singerName)
            
            SeekBarView(currentDuration: self.currentDuration, currentTime: self.$currentTime)
                .padding([.top, .bottom], 10)
            
            ControlsView(playbackMode: $playbackMode, 
                         isPlaying: $isPlaying, 
                         volume: $volume, 
                         shuffleHandler: {}, 
                         repeatHandler: {}, 
                         prevHandler: {}, 
                         playHandler: { self.playClicked() }, 
                         nextHandler: {})
        }.padding()
    }
    
    private func createBackgroundBlurImage() -> some View {
        URLImageView(url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80")
            .frame(width: 300, height: 300)
            .blur(radius: 40)
    }
    
    // MARK: - UI Actions
    private func playClicked() {
        if self.isPlaying {
            RemotePlayerURL.shared.play(songUrl)
        } else {
            RemotePlayerURL.shared.pause()
        }
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView(currentDuration: 100,
                       songImageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80", 
                       songName: "Inis Mona - Eluveiti", 
                       singerName: "Eluveitie", 
                       songUrl: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
    }
}
