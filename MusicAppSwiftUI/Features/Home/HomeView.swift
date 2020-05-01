//
//  HomeView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        UITabBarWrapper([
            TabBarElement(tabBarItem: TabBarItem(title: "Browse", image: UIImage(systemName: "music.house") ?? UIImage()), { 
                BrowseView(topOfTheWeekSongs: self.homeViewModel.albums[safe: 0]?.songs ?? [], 
                           allTimeHits: self.homeViewModel.albums[safe: 1]?.songs ?? [])
            }),
            TabBarElement(tabBarItem: TabBarItem(title: "All tracks", image: UIImage(systemName: "music.note.list") ?? UIImage()), { 
                AllTracksView(songs: self.homeViewModel.songs)
            }),
            TabBarElement(tabBarItem: TabBarItem(title: "Playlists", image: UIImage(systemName: "list.bullet") ?? UIImage()), { 
                PlaylistsView(songs: self.homeViewModel.songs)
            }),
            TabBarElement(tabBarItem: TabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass") ?? UIImage()), { 
                Text("Search")
            })
        ])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
