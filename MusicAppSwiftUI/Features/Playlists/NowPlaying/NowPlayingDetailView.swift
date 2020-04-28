//
//  NowPlayingDetailView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct NowPlayingDetailView: View {
    var songName: String
    
    var singerName: String
    
    var body: some View {
        VStack {
            Text("Now Playing")
                .padding()
            
            Text(self.songName)
                .font(.title)
                .lineLimit(nil)
            
            Text(self.singerName)
                .font(.callout)
                .lineLimit(nil)
                .padding()
        }
    }
}

struct NowPlayingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingDetailView(songName: "Inis Mona - Eluveiti", singerName: "Eluveitie")
    }
}
