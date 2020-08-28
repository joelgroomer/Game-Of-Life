//
//  CAGridController.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/26/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class CAGridController: ObservableObject {
    @Published var cagrid: CAGrid = CAGrid(dim: 25)
    @Published var alive = "square.fill"
    @Published var dead = "square"
    @Published var shapeType = ShapeType.system
    @Published var presets = ["Empty", "Big X", "Big Cross"]
    private var selectedPreset: Int = 0
    private(set) var dim: Int = 25
    private let center = NotificationCenter.default
    
    init() {
        center.addObserver(forName: Notification.Name(rawValue: "gridupdate"), object: nil, queue: .main) { _ in
            self.objectWillChange.send()
        }
    }
    
    func changeGrid(presetIndex index: Int) {
        switch index {
        case 1:
            cagrid = BigXGrid(dim: dim)
        case 2:
            cagrid = BigCrossGrid(dim: dim)
        default:
            cagrid = CAGrid(dim: dim)
        }
        selectedPreset = index
        self.objectWillChange.send()
        
    }
    
    func changeGridSize(dim: Int) {
        self.dim = dim
        changeGrid(presetIndex: selectedPreset)
    }
}
