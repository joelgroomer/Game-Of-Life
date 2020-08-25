//
//  CAGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class CAGrid {
    var dim: Int
    var grid: [Bool]
    var buffer: [Bool]
    let alive = "square.fill"
    let dead = "square"
    
    init(dim: Int) {
        self.dim = dim
        grid = Array(repeating: false, count: dim * dim)
        buffer = Array(repeating: false, count: dim * dim)
    }
    
    func reset() {
        grid = Array(repeating: false, count: dim * dim)
        buffer = Array(repeating: false, count: dim * dim)
    }
    
    func setCell(index: Int, value: Bool) {
        guard index < grid.count else { return }
        grid[index] = value
    }
    
    func prepNextGen(completion: @escaping () -> Void) {
        // test the rules against each cell to determine if it will live or die
        DispatchQueue.global().async { [self] in
            for i in 0..<dim * dim {
                let northWall = i < dim ? true : false
                let southWall = i >= dim * (dim - 1) ? true : false
                let westWall = i % dim == 0 ? true : false
                let eastWall = i % dim == dim - 1 ? true : false
                
                var count = 0
                if !northWall && !westWall && grid[i - dim - 1] { count += 1 }
                if !northWall && grid[i - dim] { count += 1 }
                if !northWall && !eastWall && grid[i - dim + 1] { count += 1 }
                if !westWall && grid[i - 1] { count += 1 }
                if !eastWall && grid[i + 1] { count += 1 }
                if !southWall && !westWall && grid[i + dim - 1] { count += 1 }
                if !southWall && grid[i + dim] { count += 1 }
                if !southWall && !eastWall && grid[i + dim + 1] { count += 1 }
                
                if grid[i] && (count == 2 || count == 3) {
                    buffer[i] = true
                } else if !grid[i] && count == 3 {
                    buffer[i] = true
                } // buffer defaults to false so no else condition is required
            }
            
            completion()
        }
    }
    
    func implementNextGen() {
        DispatchQueue.main.async { [self] in
            grid = buffer
            buffer = Array(repeating: false, count: dim * dim)
        }
    }
}
