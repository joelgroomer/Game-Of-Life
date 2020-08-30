//
//  GridView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject private var cagridController: CAGridController
    
    var body: some View {
        
        LazyVGrid(columns: Array(repeating: GridItem.init(
                                    .flexible(minimum: cagridController.shapeType.rawValue,
                                              maximum: 30)),
                                 count: cagridController.dim)) {
            ForEach(0..<cagridController.cagrid.grid.count, id: \.self) { i in
                CellView(alive: cagridController.cagrid.grid[i], index: i)
                    .padding(0)
            }
        }
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
