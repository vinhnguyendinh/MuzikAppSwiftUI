//
//  RemotePlayerURL.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI
import AVFoundation

class RemotePlayerURL {
    static let shared = RemotePlayerURL()
    
    let player = AVPlayer()
    
    private var urlString: String?
        
    private init() {
        
    }
    
    func play(_ urlString: String) {
        if self.urlString == urlString {
            self.player.play()
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: url)
        self.player.replaceCurrentItem(with: playerItem)
        self.player.play()
        
        /// Update current url
        self.urlString = urlString
    }
    
    func pause() {
        self.player.pause()
    }
    
    func changeVolume(_ value: Float) {
        self.player.volume = value
    }
    
    func seek(_ toValue: TimeInterval, completion: @escaping () -> ()) {
        let targetTime = CMTime(seconds: toValue,
                                preferredTimescale: 600)
        self.player.seek(to: targetTime) { _ in
            completion()
        }
    }
}
