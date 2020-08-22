//
//  CACell.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

// Defines the very basic Celluar Automoton cell

class CACell: ObservableObject {
    @Published private(set) var alive: Bool = false
    private var willLiveNextGen: Bool?
    var isAlive: Bool {
        return alive
    }
    var willLive: Bool {
        if willLiveNextGen != nil {
            return willLiveNextGen!
        } else {
            return false
        }
    }

    var rules: RuleSetProtocol = RuleSet.shared
    var northNeighbor: CACell?
    var northEastNeighbor: CACell?
    var eastNeighbor: CACell?
    var southEastNeighbor: CACell?
    var southNeighbor: CACell?
    var southWestNeighbor: CACell?
    var westNeighbor: CACell?
    var northWestNeighbor: CACell?
    
    func generate() {
        // decides if this cell will live or die in the next generation
        DispatchQueue.global().async {
            self.willLiveNextGen = self.rules.testCell(self)
        }
    }
    
    func updateGen() {
        // applies the decision made by the generate() method
        if let willLiveNextGen = self.willLiveNextGen {
            alive = willLiveNextGen
            self.willLiveNextGen = nil
        } else {
            generate()
            updateGen()
        }
    }
       
    func toggle() {
        self.alive.toggle()
    }
}
