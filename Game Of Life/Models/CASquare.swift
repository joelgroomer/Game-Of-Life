//
//  CASquare.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

// defines a square of exactly nine CACells or CASquares

class CASquare: CACell {
    // properties
    var r0c0: CACell
    var r0c1: CACell
    var r0c2: CACell
    var r1c0: CACell
    var r1c1: CACell
    var r1c2: CACell
    var r2c0: CACell
    var r2c1: CACell
    var r2c2: CACell

    // computed properties
    var cellArray: [CACell] {
        return [r0c0, r0c1, r0c2, r1c0, r1c1, r1c2, r2c0, r2c1, r2c2]
    }
    
    var cellArray2d: [[CACell]] {
        let row0 = [r0c0, r0c1, r0c2]
        let row1 = [r1c0, r1c1, r1c2]
        let row2 = [r2c0, r2c1, r2c2]
        return [row0, row1, row2]
    }
    
    override var isAlive: Bool {
        var count = 0
        for cell in cellArray {
            if cell.isAlive {
                count += 1
            }
        }
        
        if count >= 3 {
            return true
        }
        
        return false

    }
    
    override var willLive: Bool {
        return rules.testCell(self)
    }
    
    init(_ r0c0: CACell,
         _ r0c1: CACell,
         _ r0c2: CACell,
         _ r1c0: CACell,
         _ r1c1: CACell,
         _ r1c2: CACell,
         _ r2c0: CACell,
         _ r2c1: CACell,
         _ r2c2: CACell) {
        self.r0c0 = r0c0
        self.r0c1 = r0c1
        self.r0c2 = r0c2
        self.r1c0 = r1c0
        self.r1c1 = r1c1
        self.r1c2 = r1c2
        self.r2c0 = r2c0
        self.r2c1 = r2c1
        self.r2c2 = r2c2
    }
    
}
