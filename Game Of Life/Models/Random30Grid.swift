//
//  Random30Grid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/28/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class Random30Grid: CAGrid {
    override init(dim: Int) {
        super.init(dim: dim)
        reset()
    }
    
    override func reset() {
        for i in 0..<grid.count {
            let val = Int.random(in: 0..<10)
            grid[i] = val < 3 ? true : false
        }
        
        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
    }
}
