//
//  ProfileImageView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI
import Foundation

struct ProfileImageView: View {    
    var width: CGFloat = 180
    var height: CGFloat = 180
    
    var url: String
    
    var body: some View {
        URLImageView(url: self.url)
            .scaledToFill()
            .frame(width: self.width, height: self.height)
            .clipShape(Circle())
            .shadow(radius: 10)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80")
    }
}
