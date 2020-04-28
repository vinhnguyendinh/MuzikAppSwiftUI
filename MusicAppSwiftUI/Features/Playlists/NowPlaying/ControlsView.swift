//
//  ControlsView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

enum PlaybackMode: Int {
    case normal = 0
    case shuffle
    case `repeat`
    
    var isShuffle: Bool {
        return self == .shuffle
    }
}

struct ControlsView: View {
    @Binding var playbackMode: PlaybackMode
    
    @Binding var isPlaying: Bool
    
    @Binding var volume: Double
    
    var shuffleHandler: () -> ()
    var repeatHandler: () -> ()
    var prevHandler: () -> ()
    var playHandler: () -> ()
    var nextHandler: () -> ()
    
    var body: some View {
        VStack {
            self.createShuffleRepeatView()
            self.createControlBottomView()
        }
    }
    
    private func createShuffleRepeatView() -> some View {
        HStack(alignment: .center) {
            Button(action: {
                if self.playbackMode == .shuffle {
                    self.playbackMode = .normal
                } else {
                    self.playbackMode = .shuffle
                }
                
                self.shuffleHandler()
            }) { 
                Image(systemName: "shuffle")
                    .resizable()
                    .frame(width: 23, height: 16)
                    .foregroundColor(self.playbackMode == .shuffle ? .pinkColor : .gray)
            }
            
            Spacer()
            
            Button(action: { 
                if self.playbackMode == .repeat {
                    self.playbackMode = .normal
                } else {
                    self.playbackMode = .repeat
                }
                
                self.repeatHandler()
            }) { 
                Image(systemName: "repeat")
                    .resizable()
                    .frame(width: 23, height: 16)
                    .foregroundColor(self.playbackMode == .repeat ? .pinkColor : .gray)
            }
        }
    }
    
    private func createVolumeView() -> some View {
        let height: CGFloat = 4
        return HStack {
            Image(systemName: "speaker.2.fill")
                .resizable()
                .frame(width: 18, height: 16)
                .foregroundColor(.pinkColor)
            
            CustomSlider(value: $volume,  range: (0, 1)) { modifiers in
                ZStack {
                    Color.pinkColor.cornerRadius(height/2).frame(height: height).modifier(modifiers.barLeft)
                    Color.black.opacity(0.2).cornerRadius(height/2).frame(height: height).modifier(modifiers.barRight)
                    ZStack {
                        Circle().fill(Color.white)
                        Circle().stroke(Color.black.opacity(0.2), lineWidth: 2)
                    }.modifier(modifiers.knob)
                }
            }.frame(width: 130, height: 15)
        }
    }
    
    private func createMainControlsView() -> some View {
        return HStack(alignment: .center, spacing: 0) {
            Button(action: { 
                self.prevHandler()
            }) { 
                Image(systemName: "backward.end.fill")
                    .resizable()
                    .frame(width: 18, height: 16)
                    .foregroundColor(.black)
            }
            
            Button(action: { 
                self.isPlaying.toggle()
                self.playHandler()
            }) { 
                Image(systemName: self.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 54, height: 54)
                    .foregroundColor(.pinkColor)
            }.padding()
            
            Button(action: { 
                self.nextHandler()
            }) { 
                Image(systemName: "forward.end.fill")
                    .resizable()
                    .frame(width: 18, height: 16)
                    .foregroundColor(.black)
            }
        }
    }
    
    private func createControlBottomView() -> some View {
        HStack(alignment: .center) {
            self.createVolumeView()
            Spacer()
            self.createMainControlsView()
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(playbackMode: .constant(.repeat), isPlaying: .constant(true), volume: .constant(0.5), shuffleHandler: {}, repeatHandler: {}, prevHandler: {}, playHandler: {}, nextHandler: {})
    }
}
