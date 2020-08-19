//
//  CACell.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

// Defines the very basic Celluar Automoton cell

class CACell {
    private var alive: Bool = false
    private var willLiveNextGen: Bool = false
    var isAlive: Bool {
        return alive
    }
    var willLive: Bool {
        generate()
        return willLiveNextGen
    }
    var rules: RuleSetProtocol = RuleSet.shared
    var norhtNeighbor: CACell?
    var northEastNeighbor: CACell?
    var eastNeighbor: CACell?
    var southEastNeighbor: CACell?
    var southNeighbor: CACell?
    var southWestNeighbor: CACell?
    var westNeighbor: CACell?
    var northWestNeighbor: CACell?
    
    func generate() {
        // decides if this cell will live or die in the next generation
        self.willLiveNextGen = rules.testCell(self)
    }
    
    func kill() {
        self.alive = false
    }
    
    func revive() {
        self.alive = true
    }
}
