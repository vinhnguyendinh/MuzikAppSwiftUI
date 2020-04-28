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
    // MARK: - Properties
    @State var playbackMode: PlaybackMode = .normal
    @State var isPlaying: Bool = false
    @State var volume: Double = 1
    
    @State var currentTime: TimeInterval = 0
    @State var currentDuration: TimeInterval = 1
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var songImageUrl: String
    var songName: String
    var singerName: String
    var songUrl: String
    
    private let timeObserver = PlayerTimeObserver(player: RemotePlayerURL.shared.player)
    private let durationObserver = PlayerDurationObserver(player: RemotePlayerURL.shared.player)
    private let itemObserver = PlayerItemObserver(player: RemotePlayerURL.shared.player)
    
    // MARK: - Views
    var body: some View {
        ZStack {
            self.createBackgroundBlurImage()
            self.createPlayingView()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: self.createBackButton())
            /// Listen out for the time observer publishing changes to the player's time
            .onReceive(self.timeObserver.publisher) { time in
                /// Update the local var
                self.currentTime = time
        }
            /// Listen out for the duration observer publishing changes to the player's item duration
            .onReceive(self.durationObserver.publisher) { duration in
                /// Update the local var
                self.currentDuration = duration
        }
            /// Listen out for the item observer publishing a change to whether the player has an item
            .onReceive(self.itemObserver.publisher) { hasItem in
                self.currentTime = 0
                self.currentDuration = 1
        }
    }
    
    private func createPlayingView() -> some View {
        return VStack(alignment: .center, spacing: 0) {
            ProfileImageView(url: self.songImageUrl)
            
            NowPlayingDetailView(songName: self.songName, singerName: self.singerName)
            
            SeekBarView(currentDuration: self.$currentDuration, currentTime: self.$currentTime, onDragHandler: { editingStarted in
                self.sliderEditingChanged(editingStarted)
            })
                .padding([.top, .bottom], 10)
            
            ControlsView(playbackMode: $playbackMode, 
                         isPlaying: $isPlaying, 
                         volume: $volume, 
                         shuffleHandler: {}, 
                         repeatHandler: {}, 
                         prevHandler: {}, 
                         playHandler: { self.playClicked() }, 
                         nextHandler: {},
                         volumeDragHandler: { editingStarted in self.volumeEditingChanged(editingStarted) 
            })
        }.padding()
    }
    
    private func createBackgroundBlurImage() -> some View {
        URLImageView(url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80")
            .frame(width: 300, height: 300)
            .blur(radius: 40)
    }
    
    private func createBackButton() -> some View {
        return Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                Text("Playlist")
                    .foregroundColor(.black)
            }
        }
    }
    
    // MARK: - UI Actions
    private func playClicked() {
        if self.isPlaying {
            RemotePlayerURL.shared.play(songUrl)
        } else {
            RemotePlayerURL.shared.pause()
        }
    }
    
    private func sliderEditingChanged(_ editingStarted: Bool) {
        if editingStarted {
            /// Tell the PlayerTimeObserver to stop publishing updates while the user is interacting
            /// with the slider (otherwise it would keep jumping from where they've moved it to, back
            /// to where the player is currently at)
            self.timeObserver.pause(true)
        }
        else {
            /// Editing finished, start the seek
            RemotePlayerURL.shared.seek(self.currentTime) { 
                /// Now the (async) seek is completed, resume normal operation
                self.timeObserver.pause(false)
            }
        }
    }
    
    private func volumeEditingChanged(_ editingStarted: Bool) {
        RemotePlayerURL.shared.changeVolume(Float(self.volume))
    }
}

struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView(currentTime: 30,
                       currentDuration: 100,
                       songImageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80", 
                       songName: "Inis Mona - Eluveiti", 
                       singerName: "Eluveitie", 
                       songUrl: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
    }
}
