//
//  Song.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

// MARK: - Song
class Song: NSObject, Identifiable, Codable {
    var id: String = UUID().uuidString
    
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
    
    init(id: String, name: String, singer: Singer, artist: Artist, time: Double, comments: [Comment], lyrics: [Double: String], imageUrl: String, url: String, genre: SongGenre) {
        self.id = id
        self.name = name
        self.singer = singer
        self.artist = artist
        self.time = time
        self.comments = comments
        self.lyrics = lyrics
        self.imageUrl = imageUrl
        self.url = url
        self.genre = genre
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        singer = try? container.decode(Singer.self, forKey: .singer)
        artist = try? container.decode(Artist.self, forKey: .artist)
        time = try? container.decode(Double.self, forKey: .time)
        imageUrl = try? container.decode(String.self, forKey: .imageUrl)
        url = try? container.decode(String.self, forKey: .url)
        genre = try container.decode(SongGenre.self, forKey: .genre)
    }
    
    static let `default` = Song(id: UUID().uuidString, name: "Hallowed be thy name", singer: Singer.default, artist: Artist.default, time: 100, comments: [], lyrics: [:], imageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80", url: "https://s3.amazonaws.com/kargopolov/kukushka.mp3", genre: .pop)
}

// MARK: - Song genre
enum SongGenre: Int, Codable {
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
