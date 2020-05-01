//
//  Comment.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct Comment: Identifiable, Codable {
    var id: String = UUID().uuidString
    
    var content: String?
    
    var user: User?
    
    static let `default` = Comment(id: UUID().uuidString, content: "Comment demo", user: User.default)
}
