//
//  DoubleExtensions.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2020/04/27.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

extension Double {
    func convert(fromRange: (Double, Double), toRange: (Double, Double)) -> Double {
        // Example: if self = 1, fromRange = (0,2), toRange = (10,12) -> solution = 11
        var value = self
        value -= fromRange.0
        value /= Double(fromRange.1 - fromRange.0)
        value *= toRange.1 - toRange.0
        value += toRange.0
        return value
    }
    
    func getTimeString() -> String {
        guard self > 0 else {
            return "00:00"
        }
        
        // Caculate minute and second
        let minute: Int = Int(self/60)
        let second: Int = Int(Int(self) % 60)
        
        // Create minute and second string
        let minuteString = minute > 10 ? "\(minute)" : "0\(minute)"
        let secondString = second > 10 ? "\(second)" : "0\(second)"
        
        return "\(minuteString):\(secondString)"
    }
}
