//
//  RemotePlayerURL.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI
import AVFoundation

class RemotePlayerURL: ObservableObject {
    static let shared = RemotePlayerURL()
    
    let player = AVPlayer()
    
    @Published var duration: Double = 0
    
    private init() {
        
    }
    
    func play(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        self.player.replaceCurrentItem(with: playerItem)
        self.player.play()
        
        guard let duration = self.player.currentItem?.asset.duration else {
            return
        }
        self.duration = CMTimeGetSeconds(duration)
    }
    
    func pause() {
        self.player.pause()
    }
    
    func changeVolume(_ value: Float) {
        self.player.volume = value
    }
    
    func seek(_ toValue: Float) {
        self.player.seek(to: CMTime(seconds: Double(toValue), preferredTimescale: 1))
    }
}
