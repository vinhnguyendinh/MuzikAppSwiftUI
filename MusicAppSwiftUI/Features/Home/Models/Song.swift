//
//  Song.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

// MARK: - Song
class Song: NSObject, Identifiable {
    var id: String
    
    var name: String?
    
    var singer: Singer?
    
    var artist: Artist?
    
    var time: Double?
    
    var comments: [Comment]?
    
    var lyrics: [Double: String]?
    
    var isPlaying: Bool = false
    
    var imageUrl: String?
    
    var url: String?
    
    var genre: SongGenre = .unknown
    
    init(id: String, name: String, singer: Singer?, imageUrl: String?, url: String, genre: SongGenre) {
        self.id = id
        self.name = name
        self.singer = singer
        self.imageUrl = imageUrl
        self.url = url
        self.genre = genre
    }
}

// MARK: - Song genre
enum SongGenre: Int {
    case unknown = 0
    case fav
    case rock
    case folk
    case pop
}

extension SongGenre: CustomStringConvertible {
    var description: String {
        switch self {
        case .unknown:
            return "Unknown"
        case .fav:
            return "Fav"
        case .rock:
            return "Rock"
        case .folk:
            return "Folk"
        case .pop:
            return "Pop"
        }
    }
}

extension SongGenre: Identifiable {
    var id: String {
        return UUID().uuidString
    }
}
