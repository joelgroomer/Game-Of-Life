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
    @Published var presets = ["Empty", "Big X", "Big Cross", "Glider", "Lightweight Spaceship", "Random Grid", "Random Grid 20%", "Random Grid 30%"]
    private var selectedPreset: Int = 0
    private(set) var dim: Int = 25
    private let center = NotificationCenter.default
    
    init() {
        center.addObserver(forName: Notification.Name(rawValue: "gridupdate"), object: nil, queue: .main) { _ in
            self.objectWillChange.send()
        }
    }
    
    func changeGrid(presetIndex index: Int) {
        DispatchQueue.global().async { [self] in
            switch index {
            case 1:
                cagrid = BigXGrid(dim: dim)
            case 2:
                cagrid = BigCrossGrid(dim: dim)
            case 3:
                cagrid = GliderGrid(dim: dim)
            case 4:
                cagrid = LightweightSpaceshipGrid(dim: dim)
            case 5:
                cagrid = RandomGrid(dim: dim)
            case 6:
                cagrid = Random20Grid(dim: dim)
            case 7:
                cagrid = Random30Grid(dim: dim)
            default:
                // "Empty" grid (index 0)
                cagrid = CAGrid(dim: dim)
            }
            selectedPreset = index
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
        
    }
    
    func changeGridSize(dim: Int) {
        self.dim = dim
        changeGrid(presetIndex: selectedPreset)
    }
}
