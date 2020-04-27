//
//  People.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import UIKit

class People: NSObject, Identifiable {
    var id: String
    
    var name: String?
    
    var dateOfBirth: String? // yyyyMMdd
    
    var imageUrl: String?
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

class Artist: People {
    
}

class Singer: People {
    
}

class User: People {
    var userName: String?
    
    var password: String?
}
