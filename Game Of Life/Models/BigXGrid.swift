//
//  BigXGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/26/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class BigXGrid: CAGrid {
    override init(dim: Int) {
        super.init(dim: dim)
        
        reset()
    }
    
    override func reset() {
        buffer = Array(repeating: false, count: dim * dim)
        for i in 0..<dim {
            for j in 0..<dim {
                if i == j || j + i == dim - 1 {
                    grid[i * dim + j] = true
                } else {
                    grid[i * dim + j] = false
                }
            }
        }
        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
    }
}
