//
//  SongGenreItemView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/17.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SongGenreItemView: View {
    var songGenre: SongGenre
    
    var index: Int
    
    var isSelected: Bool
    
    var tapGesture: () -> ()
    
    var width: CGFloat = 100
    
    var body: some View {
        Text(songGenre.description)
            .font(.title)
            .foregroundColor(self.isSelected ? .white : Color.pinkColor)
            .frame(width: self.width, height: self.width)
            .background(self.isSelected ? Color.pinkColor : Color.pinkOverlayColor)
            .clipShape(Circle())
            .shadow(radius: 5)
            .onTapGesture {
                self.tapGesture()
        }
    }
}

struct SongGenreItemView_Previews: PreviewProvider {
    static var previews: some View {
        SongGenreItemView(songGenre: .fav, index: 0, isSelected: true, tapGesture: {})
    }
}
