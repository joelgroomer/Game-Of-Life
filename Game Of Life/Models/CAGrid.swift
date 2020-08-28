//
//  CAGrid.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class CAGrid: ObservableObject {
    @Published var dim: Int
    @Published var grid: [Bool]
    var buffer: [Bool]
    let center = NotificationCenter.default
    
    init(dim: Int) {
        self.dim = dim
        grid = Array(repeating: false, count: dim * dim)
        buffer = Array(repeating: false, count: dim * dim)
        center.addObserver(forName: Notification.Name(rawValue: "generation"), object: nil, queue: .main) { _ in
            self.prepNextGen {
                self.implementNextGen()
            }
        }
    }
    
    func changeDim(_ val: Int) {
        dim = val
        reset()
    }
    
    func reset() {
        grid = Array(repeating: false, count: dim * dim)
        buffer = Array(repeating: false, count: dim * dim)
        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
    }
    
    func setCell(index: Int, value: Bool?) {
        // sets the cell to `value` if provided, or toggles if not
        guard index < grid.count else { return }
        if let value = value {
            grid[index] = value            
        } else {
            grid[index].toggle()
        }
        self.objectWillChange.send()
        center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
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
            center.post(Notification(name: (NSString("gridupdate")) as Notification.Name))
        }
    }
}
