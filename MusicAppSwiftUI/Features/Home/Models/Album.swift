//
//  Album.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct Album: Identifiable, Codable {
    var id: String = UUID().uuidString
    
    var name: String?
    
    var year: String?
    
    var songs: [Song]?
    
    static let `default` = Album(id: UUID().uuidString, name: "Sexbombs", year: "2020", songs: [Song.default])
}
