//
//  RandomGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/28/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class RandomGrid: CAGrid {
    override init(dim: Int) {
        super.init(dim: dim)
        reset()
    }
    
    override func reset() {
        for i in 0..<grid.count {
            grid[i] = Bool.random()
        }

        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
    }
}
