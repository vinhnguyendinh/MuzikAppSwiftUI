//
//  ArrayExtensions.swift
//  MusicAppSwiftUI
//
//  Created by Vinh Nguyen on 2020/04/28.
//  Copyright © 2020 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

extension Array {
    func getMaxItem(_ maxItemNumbers: Int) -> [Element] {
        guard maxItemNumbers <= self.count else {
            return self
        }
        
        var result: [Element] = []
        (0..<maxItemNumbers).forEach({
            result.append(self[$0])
        })
        return result
    }
}
