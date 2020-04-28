//
//  SeekBarView.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct SeekBarView: View {
    // !Important: Current duration must greater than 0
    @Binding var currentDuration: TimeInterval
    
    @Binding var currentTime: TimeInterval
    
    var onDragHandler: (_ editingStarted: Bool) -> ()
    
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
                    CustomSlider(value: self.$currentTime, range: (0, self.currentDuration), viewBuilder: { modifiers in
                        ZStack {
                            Color.pinkColor
                                .modifier(modifiers.barLeft)
                            Color.black.opacity(0.2)
                                .modifier(modifiers.barRight)
                        }.clipShape(MagnitudeChart())
                    }, onDragHandler: { editingStarted in
                        self.onDragHandler(editingStarted)
                    }).frame(height: 45)
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
        SeekBarView(currentDuration: .constant(100), currentTime: .constant(30), onDragHandler: { _ in })
    }
}
