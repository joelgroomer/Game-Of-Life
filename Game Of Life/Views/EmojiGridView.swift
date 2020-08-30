//
//  EmojiGridView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/29/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI


// This is exactly the same as the GridView
// For some reason having them as separate classes makes switching between
// system grids and emoji grids much faster (but still a little slow)

struct EmojiGridView: View {
    @EnvironmentObject private var cagridController: CAGridController
    
    var body: some View {
        
        LazyVGrid(columns: Array(repeating: GridItem.init(
                                    .flexible(minimum: cagridController.shapeType.rawValue,
                                              maximum: cagridController.shapeType.rawValue)),
                                 count: cagridController.dim)) {
            ForEach(0..<cagridController.cagrid.grid.count, id: \.self) { i in
                CellView(alive: cagridController.cagrid.grid[i], index: i)
                    .padding(0)
            }
        }
        .padding()
    }
}

struct EmojiGridView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGridView()
    }
}
