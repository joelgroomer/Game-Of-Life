//
//  GliderGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/28/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class GliderGrid: CAGrid {
    override init(dim: Int) {
        super.init(dim: dim)
        
        reset()
    }
    
    override func reset() {
        /* Glider shape
             010
             001
             111
         */
        
        let mid = dim / 2
        let gliderCells = [dim * (mid - 1) + mid,
                           dim * mid + 1 + mid,
                           dim * (mid + 1) - 1 + mid,
                           dim * (mid + 1) + mid,
                           dim * (mid + 1) + 1 + mid]
        
        // set all cells to false
        for i in 0..<grid.count {
            grid[i] = false
        }
        // set the cells that make up the glider shape to true
        for g in gliderCells {
            grid[g] = true
        }
        
        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
    }
}
