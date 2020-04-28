//
//  SongRow.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SongRow: View {
    var songName: String
    
    var singerName: String
    
    var time: TimeInterval
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(self.songName)
                    .font(.callout)
                    .padding(.bottom, 10)
                    .lineLimit(nil)
                
                Text(self.singerName)
                    .font(.caption)
                    .lineLimit(nil)
            }
            
            Spacer()
            
            Text(Utility.formatSecondsToHMS(self.time))
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(nil)
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(songName: "Hallowed be thy name", singerName: "Iron Maiden", time: 100)
    }
}
