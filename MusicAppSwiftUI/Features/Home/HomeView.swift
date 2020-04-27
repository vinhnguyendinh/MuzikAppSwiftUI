//
//  HomeView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UITabBarWrapper([
            TabBarElement(tabBarItem: TabBarItem(title: "Browse", image: UIImage(systemName: "music.house") ?? UIImage()), { 
                Text("Browse")
            }),
            TabBarElement(tabBarItem: TabBarItem(title: "All tracks", image: UIImage(systemName: "music.note.list") ?? UIImage()), { 
                Text("All tracks")
            }),
            TabBarElement(tabBarItem: TabBarItem(title: "Playlists", image: UIImage(systemName: "list.bullet") ?? UIImage()), { 
                Text("Playlists")
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
