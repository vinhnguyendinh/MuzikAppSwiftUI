//
//  PlaylistsView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct PlaylistsView: View {
    var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                self.createSongListView()
            }.navigationBarTitle("Playlist")
        }
    }
    
    private func createSongListView() -> some View {
        return List {
            SongGenresView(songs: songs, height: 120)

            ForEach(songs) { song in
                NavigationLink(destination: self.createNowPlayingView(with: song)) {
                    PlaylistRow(songName: song.name ?? "", 
                                singerName: song.singer?.name ?? "")
                }
            }
        }
    }
    
    private func createNowPlayingView(with song: Song) -> some View {
        return NowPlayingView(time: song.time ?? 0, songImageUrl: song.imageUrl ?? "", songName: song.name ?? "", singerName: song.singer?.name ?? "", songUrl: song.url ?? "")
    }
}

struct PlaylistsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistsView(songs: [Song.default, Song.default])
    }
}
