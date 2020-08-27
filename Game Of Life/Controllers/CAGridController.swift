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
    let center = NotificationCenter.default
    
    init() {
        center.addObserver(forName: Notification.Name(rawValue: "gridupdate"), object: nil, queue: .main) { _ in
            self.objectWillChange.send()
        }
    }
}
