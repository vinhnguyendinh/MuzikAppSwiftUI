//
//  BrowseView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct BrowseView: View {
    var topOfTheWeekSongs: [Song]
    
    var allTimeHits: [Song]
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            self.createSongListView()
                .navigationBarTitle("Browse")
                .gesture(DragGesture().onChanged({ _ in
                    UIApplication.shared.endEditing()
                }))
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
    
    private func createSongListView() -> some View {
        return List {
            SearchBar(searchText: self.$searchText)
            self.createTopOfTheWeekView()
            self.createAllTimeHitsView()
        }
    }
    
    private func createTopOfTheWeekView() -> some View {
        return Group {
            self.createHeaderView(title: "Top of the week") {
                
            }.animation(nil)
            
            ForEach(self.topOfTheWeekSongs.getMaxItem(3)) { song in
                ZStack(alignment: .leading) {
                    BrowseRow(imageSongUrl: song.imageUrl ?? "",
                              songName: song.name ?? "",
                              singerName: song.singer?.name ?? "",
                              downloadUrl: "")
                    NavigationLink(destination: self.createNowPlayingView(with: song)) {
                        EmptyView()
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    private func createAllTimeHitsView() -> some View {
        return Group {
            self.createHeaderView(title: "All time hits") {
                
            }
            
            ForEach(self.allTimeHits.getMaxItem(3)) { song in
                ZStack(alignment: .leading) {
                    BrowseRow(imageSongUrl: song.imageUrl ?? "",
                              songName: song.name ?? "",
                              singerName: song.singer?.name ?? "",
                              downloadUrl: "")
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
                              backButtonTitle: "Browse")
    }
    
    private func createHeaderView(title: String, seeAllHandler: @escaping () -> ()) -> some View {
        return VStack {
            HStack(alignment: .center, spacing: 0) {
                Text(title)
                    .font(.body)
                Spacer()
                Button(action: {
                    seeAllHandler()
                }) {
                    Text("See All".uppercased())
                        .foregroundColor(Color.pinkColor)
                        .font(.body)
                    
                }
            }
            
            Divider()
        }.buttonStyle(PlainButtonStyle())
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(topOfTheWeekSongs: [Song.default, Song.default], allTimeHits: [Song.default])
    }
}
