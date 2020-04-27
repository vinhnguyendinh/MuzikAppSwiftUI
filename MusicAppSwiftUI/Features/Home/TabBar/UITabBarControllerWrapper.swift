//
//  UITabBarControllerWrapper.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct UITabBarControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = UITabBarController
    
    var viewControllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabbarController = UITabBarController()
        
        // Background color tab bar
        tabbarController.tabBar.barTintColor = UIColor(rgb: 0xFF4060)
        
        return tabbarController
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        uiViewController.setViewControllers(self.viewControllers, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator(self)
        return coordinator
    }
    
    class Coordinator: NSObject {
        var parent: UITabBarControllerWrapper
        
        init(_ parent: UITabBarControllerWrapper) {
            self.parent = parent
        }
    }
}
