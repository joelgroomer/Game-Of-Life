//
//  RuleSet.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

// defines the basic rules for whether a cell will live or die on the next generation

class RuleSet: RuleSetProtocol {
    static var shared: RuleSetProtocol = RuleSet()
    
    // If a cell is alive and has either 2 or 3 neighbors, it survives; otherwise it dies
    // If a cell is dead and it has exactly 3 neighbors, it comes to life
    
    func testCell(_ cell: CACell) -> Bool {
        let count = countNeighbors(n: cell.northNeighbor,
                                   ne: cell.northEastNeighbor,
                                   e: cell.eastNeighbor,
                                   se: cell.southEastNeighbor,
                                   s: cell.southNeighbor,
                                   sw: cell.southWestNeighbor,
                                   w: cell.westNeighbor,
                                   nw: cell.northWestNeighbor)
        var willLive = false
        
        if cell.isAlive && (count == 2 || count == 3) {
            willLive = true
        }
        
        if !cell.isAlive && count == 3 {
            willLive = true
        }
        
        return willLive
    }
        
    func countNeighbors(n: CACell?, ne: CACell?, e: CACell?, se: CACell?, s: CACell?, sw: CACell?, w: CACell?, nw: CACell?) -> Int {
        var count = 0
        
        if n != nil && n!.isAlive { count += 1 }
        if ne != nil && n!.isAlive { count += 1 }
        if e != nil && n!.isAlive { count += 1 }
        if se != nil && n!.isAlive { count += 1 }
        if s != nil && n!.isAlive { count += 1 }
        if sw != nil && n!.isAlive { count += 1 }
        if w != nil && n!.isAlive { count += 1 }
        if nw != nil && n!.isAlive { count += 1 }
        
        return count
    }
}
