//
//  Shape.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/25/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

struct Shape: Hashable {
    var offName: String
    var onName: String
    var selected: Bool
    var title: String
    var type: ShapeType
    
}

enum ShapeType {
    case system
    case asset
    case emoji
}
