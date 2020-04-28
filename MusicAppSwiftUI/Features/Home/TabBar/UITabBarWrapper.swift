//
//  UITabBarWrapper.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct UITabBarWrapper: View {
    var controllers: [UIHostingController<TabBarElement>]
    
    init(_ tabBarElements: [TabBarElement]) {
        self.controllers = tabBarElements.enumerated().map {
            let hostingVC = UIHostingController(rootView: $1)
            
            // Init tab bar item
            let tabBarItem = UITabBarItem(title: $1.tabBarItem.title, 
                                          image: $1.tabBarItem.image, 
                                          tag: $0)
            
            // Set tint color for tab bar item]
            let colorNormal = UIColor.black.withAlphaComponent(0.25)
            let selectedColor = UIColor.white

            UITabBar.appearance().unselectedItemTintColor = colorNormal
            UITabBar.appearance().tintColor = selectedColor

            // Set tab bar item to hosting view controller
            hostingVC.tabBarItem = tabBarItem
            
            return hostingVC
        }
    }
    
    var body: some View {
        UITabBarControllerWrapper(viewControllers: self.controllers)
    }
}

struct UITabBarWrapper_Previews: PreviewProvider {
    static var previews: some View {
        UITabBarWrapper([
            TabBarElement(tabBarItem: TabBarItem(title: "Playlists", image: UIImage(systemName: "list.bullet") ?? UIImage()), { 
                Text("Playlists")
            })
        ])
    }
}
