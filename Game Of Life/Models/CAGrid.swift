//
//  CAGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

// defines the grid on which the simulation takes place

class CAGrid {
    let dimensions: Int
    var grid: [CACell] = []
    var buffer: [Bool] {
        var b: [Bool] = []
        for cell in grid {
            b.append(cell.willLive)
        }
        return b
    }
    var display: [Bool] {
        var d: [Bool] = []
        for cell in grid {
            d.append(cell.isAlive)
        }
        return d
    }
    
    
    init(dimensions dim: Int) {
        self.dimensions = dim
        
        for _ in 0..<dim*dim {
            grid.append(CACell())
        }
        
        for i in 0..<dim*dim {
            let northWall = i < dim ? true : false
            let southWall = i >= dim * (dim - 1) ? true : false
            let westWall = i % dim == 0 ? true : false
            let eastWall = i % dim == dim - 1 ? true : false
            
            if !northWall && !westWall { grid[i].northWestNeighbor = grid[i - dim - 1] }
            if !northWall { grid[i].northNeighbor = grid[i - dim] }
            if !northWall && !eastWall { grid[i].northEastNeighbor = grid[i - dim + 1] }
            if !westWall { grid[i].westNeighbor = grid[i - 1] }
            if !eastWall { grid[i].eastNeighbor = grid[i + 1] }
            if !southWall && !westWall { grid[i].southWestNeighbor = grid[i + dim - 1] }
            if !southWall { grid[i].southNeighbor = grid[i + dim] }
            if !southWall && !eastWall { grid[i].southEastNeighbor = grid[i + dim + 1] }
            
        }
    }
    
}
