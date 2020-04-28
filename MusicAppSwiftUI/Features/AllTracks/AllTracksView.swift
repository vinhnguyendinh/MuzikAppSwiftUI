//
//  AllTracksView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct AllTracksView: View {
    var songs: [Song]
    
    init(songs: [Song]) {
        self.songs = songs
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            self.createSongListView()
                .navigationBarTitle("All Tracks")
        }
    }
    
    private func createSongListView() -> some View {
        return List {
            ForEach(songs) { song in
                ZStack(alignment: .leading) {
                    SongRow(songName: song.name ?? "",
                            singerName: song.singer?.name ?? "",
                            time: song.time ?? 0)
                    
                    NavigationLink(destination: self.createNowPlayingView(with: song)) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    private func createNowPlayingView(with song: Song) -> some View {
        return NowPlayingView(currentDuration: 100,
                              songImageUrl: song.imageUrl ?? "",
                              songName: song.name ?? "",
                              singerName: song.singer?.name ?? "",
                              songUrl: song.url ?? "",
                              backButtonTitle: "All Tracks")
    }
}

struct AllTracksView_Previews: PreviewProvider {
    static var previews: some View {
        AllTracksView(songs: [Song.default])
    }
}
