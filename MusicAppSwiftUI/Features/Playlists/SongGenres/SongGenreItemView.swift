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
    
    @Binding var isSelected: Bool
    
    var body: some View {
        Text(songGenre.description)
            .font(.title)
            .foregroundColor(self.isSelected ? .white : Color.pinkColor)
            .frame(width: 100, height: 100)
            .background(self.isSelected ? Color.pinkColor : Color.pinkOverlayColor)
            .clipShape(Circle())
            .shadow(radius: 10)
            .onTapGesture {
                self.isSelected = !self.isSelected
                print(self.isSelected)
        }
    }
}

struct SongGenreItemView_Previews: PreviewProvider {
    static var previews: some View {
        SongGenreItemView(songGenre: .fav, isSelected: .constant(true))
    }
}
