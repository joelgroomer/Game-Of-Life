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
            
            ForEach(0..<grid.dim, id: \.self) { i in
                ForEach(0..<self.grid.dim) { j in
                    CellView(grid: $grid, index: i * grid.dim + j)
                        .id(UUID())
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(grid: .constant(CAGrid(dim: 25)))
    }
}
