//
//  PlaylistRow.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct PlaylistRow: View {
    var songName: String
    
    var singerName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.songName)
                .font(.callout)
                .padding(.bottom, 10)
            
            Text(self.singerName)
                .font(.caption)
        }
    }
}

struct PlaylistRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistRow(songName: "Hallowed be thy name", singerName: "Iron Maiden")
    }
}
