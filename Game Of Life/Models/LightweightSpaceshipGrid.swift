//
//  LightweightSpaceshipGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/28/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class LightweightSpaceshipGrid: CAGrid {
    override init(dim: Int) {
        super.init(dim: dim)
        
        reset()
    }
    
    override func reset() {
        /* Lightweight spaceship shape
             01111
             10001
             00001
             10010
         */
        
        let mid = dim / 2
        let spaceshipCells = [dim * (mid - 2) + mid - 1,
                           dim * (mid - 2) + mid,
                           dim * (mid - 2) + mid + 1,
                           dim * (mid - 2) + mid + 2,
                           
                           dim * (mid - 1) + mid - 2,
                           dim * (mid - 1) + mid + 2,
                           
                           dim * mid + mid + 2,
                           
                           dim * (mid + 1) + mid - 2,
                           dim * (mid + 1) + mid + 1]
        
        // set all cells to false
        for i in 0..<grid.count {
            grid[i] = false
        }
        // set the cells that make up the glider shape to true
        for s in spaceshipCells {
            grid[s] = true
        }
        
        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
    }
}
