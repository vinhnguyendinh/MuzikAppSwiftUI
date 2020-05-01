//
//  HomeViewModel.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/30.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var albums: [Album] = []
    
    @Published var songs: [Song] = []

    
    init() {
        self.getAllAlbums()
    }
    
    func getAllAlbums() {
        self.albums = Network.shared.getAlbums()
        
        self.songs = self.albums.reduce([]) { $0 + ($1.songs ?? []) }
    }
}
