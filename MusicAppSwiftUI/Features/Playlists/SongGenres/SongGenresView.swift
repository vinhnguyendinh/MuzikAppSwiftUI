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
    
    @State var indexSelcted: Int = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    private func createListSongGenres() -> some View {
        let allGenreList = self.songs.map { $0.genre }
        
        var genres: [SongGenre] = []
        allGenreList.forEach({ genreItem in
            if genres.firstIndex(where: { $0 == genreItem }) == nil {
                genres.append(genreItem)
            }
        })
        
        List {
            ForEach(genres) {
                SongGenreItemView(songGenre: $0, isSelected: <#T##Binding<Bool>#>)
            }
        }
    }
}

struct SongGenresView_Previews: PreviewProvider {
    static var previews: some View {
        SongGenresView(songs: [])
    }
}
