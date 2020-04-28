//
//  URLImageView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct URLImageView: View {
    @ObservedObject private var remoteImageURL = RemoteImageURL()
    
    var placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        self.remoteImageURL.load(url)
    }
    
    var body: some View {
        if let uiImage = self.remoteImageURL.downloadedImage {
            return Image(uiImage: uiImage).resizable()
        } else {
            return self.placeholder.resizable()
        }    
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2134&q=80")
    }
}
