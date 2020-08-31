//
//  BigCrossGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/26/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class BigCrossGrid: CAGrid {
    override init(dim: Int) {
        super.init(dim: dim)
        reset()
    }
    
    override func reset() {
        buffer = Array(repeating: false, count: dim * dim)
        
        // even dims create a double-wide cross
        let offset = dim % 2 == 0 ? -1 : 0
        let half = dim / 2
        
        for i in 0..<dim {
            for j in 0..<dim {
                if i == half || i == half + offset
                    || j == half || j == half + offset {
                    grid[i * dim + j] = true
                } else {
                    grid[i * dim + j] = false
                }
            }
        }
        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
    }
}
