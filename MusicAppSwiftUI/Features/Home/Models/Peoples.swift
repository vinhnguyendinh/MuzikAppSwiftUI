//
//  People.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import UIKit

protocol People: Identifiable, Codable {
    var id: String { get set } 
    
    var name: String? { get set }
    
    // yyyyMMdd
    var dateOfBirth: String? { get set }
    
    var imageUrl: String? { get set }
}

extension People {
    var id: String {
        return UUID().uuidString
    }
}

struct Artist: People {
    var id: String
    
    var name: String?
    
    var dateOfBirth: String?
    
    var imageUrl: String?
        
    static let `default` = Artist(id: UUID().uuidString, name: "Vinh Nguyen", dateOfBirth: "19961202", imageUrl: "https://images.unsplash.com/photo-1542583701-20d3be307eba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80")
}

struct Singer: People {
    var id: String
    
    var name: String?
    
    var dateOfBirth: String?
    
    var imageUrl: String?
        
    static let `default` = Singer(id: UUID().uuidString, name: "Vinh Nguyen", dateOfBirth: "19961202", imageUrl: "https://images.unsplash.com/photo-1542583701-20d3be307eba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80")
}

struct User: People {
    var id: String
    
    var name: String?
    
    var dateOfBirth: String?
    
    var imageUrl: String?
        
    var userName: String?
    
    var password: String?
    
    static let `default` = User(id: UUID().uuidString, name: "Vinh Nguyen", dateOfBirth: "19961202", imageUrl: "https://images.unsplash.com/photo-1542583701-20d3be307eba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80", userName: "vinhnguyendinhbg", password: "1111")
}
