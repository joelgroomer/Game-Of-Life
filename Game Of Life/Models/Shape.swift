//
//  Shape.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/25/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation
import UIKit

struct Shape: Hashable {
    var offName: String
    var onName: String
    var selected: Bool
    var title: String
    var type: ShapeType
    
}

enum ShapeType: CGFloat {
    case system = 12.0
    case asset = 30.0
    case emoji = 20.0
}
