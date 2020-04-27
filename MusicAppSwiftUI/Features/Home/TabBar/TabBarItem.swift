//
//  TabBarItem.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct TabBarItem {
    var title: String
    var image: UIImage
}

protocol TabBarItemView: View {
    associatedtype Content
    
    var content: Content { get set }
    var tabBarItem: TabBarItem { get set }
}

struct TabBarElement: TabBarItemView {        
    internal var content: AnyView
    var tabBarItem: TabBarItem
    
    init<Content: View>(tabBarItem: TabBarItem, @ViewBuilder _ content: () -> Content) {
        self.tabBarItem = tabBarItem
        self.content = AnyView(content())
    }
    
    var body: some View {
        self.content
    }
}

struct TabBarElement_Previews: PreviewProvider {
    static var previews: some View {
        TabBarElement(tabBarItem: TabBarItem(title: "Playlists", image: UIImage(systemName: "list.bullet") ?? UIImage())) { 
            Text("Playlists")
        }
    }
}
