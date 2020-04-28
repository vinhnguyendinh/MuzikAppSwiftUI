//
//  SeekBarView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SeekBarView: View {
    var time: Double
    
    @Binding var sliderValue: Double
    
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
                    CustomSlider(value: $sliderValue, range: (0, self.time), knobWidth: 0) { modifiers in
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
            Text(self.sliderValue.getTimeString())
                .foregroundColor(.gray)
                .font(.caption)
            Spacer()
            Text(self.time.getTimeString())
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
}

struct SeekBarView_Previews: PreviewProvider {
    static var previews: some View {
        SeekBarView(time: 100, sliderValue: .constant(50))
    }
}
