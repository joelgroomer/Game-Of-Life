//
//  GridView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct GridView: View {
    @State private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 25)
    @Binding var grid: CAGrid
    
    var body: some View {
            
        LazyVGrid(columns: columns) {
            ForEach(0..<grid.dim * grid.dim, id: \.self) { i in
                CellView(alive: grid.grid[i], grid: $grid, index: i)
                    .padding(0)
            }
        }
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(grid: .constant(CAGrid(dim: 25)))
    }
}
