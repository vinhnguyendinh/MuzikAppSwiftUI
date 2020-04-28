//
//  SongGenresView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SongGenresView: View {
    var songs: [Song]
    
    var height: CGFloat = 120
    
    @State private var indexSelected: Int = 0
    
    init(songs: [Song], height: CGFloat) {
        self.songs = songs
        self.height = height
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        self.createListSongGenres()
    }
    
    private func createListSongGenres() -> some View {
        let allGenreList = self.songs.map { $0.genre }
        
        var genres: [SongGenre] = []
        allGenreList.forEach({ genreItem in
            if genres.firstIndex(where: { $0 == genreItem }) == nil {
                genres.append(genreItem)
            }
        })

        return ScrollView (.horizontal, showsIndicators: false) {
             HStack {
                 ForEach(genres.enumeratedArray(), id: \.element) { index, item in
                     SongGenreItemView(songGenre: item, index: index, isSelected: self.indexSelected == index) { 
                         self.indexSelected = index
                     }.frame(height: self.height)
                 }
             }
        }.frame(height: self.height)

    }
}

extension Collection {
    func enumeratedArray() -> Array<(offset: Int, element: Self.Element)> {
        return Array(self.enumerated())
    }
}

struct SongGenresView_Previews: PreviewProvider {
    static var previews: some View {
        SongGenresView(songs: [Song.default, Song.default], height: 120)
    }
}
