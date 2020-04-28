//
//  SeekBarView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SeekBarView: View {
    var currentDuration: TimeInterval
    
    @Binding var currentTime: TimeInterval
    
    var body: some View {
        VStack {
            self.createSeekBar()
            self.createDurationView()
        }
    }
    
    private func createSeekBar() -> some View {
        return ZStack {
            VStack(spacing: 0) {
                Group {
                    CustomSlider(value: $currentTime, range: (0, self.currentDuration), knobWidth: 0) { modifiers in
                        ZStack {
                            Color.pinkColor
                                .modifier(modifiers.barLeft)
                            Color.black.opacity(0.2)
                                .modifier(modifiers.barRight)
                        }.clipShape(MagnitudeChart())
                    }.frame(height: 45)  
                }
            }
        }
    }
    
    private func createDurationView() -> some View {
        return HStack(alignment: .center) {
            Text(Utility.formatSecondsToHMS(self.currentTime))
                .foregroundColor(.gray)
                .font(.caption)
            Spacer()
            Text(Utility.formatSecondsToHMS(self.currentDuration))
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

struct SeekBarView_Previews: PreviewProvider {
    static var previews: some View {
        SeekBarView(currentDuration: 100, currentTime: .constant(30))
    }
}
