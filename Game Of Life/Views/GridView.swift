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
        VStack() {
            
            ForEach(0..<grid.dim, id: \.self) { i in
                HStack {
                    ForEach(0..<self.grid.dim) { j in
                        CellView(alive: grid.grid[i * grid.dim + j], grid: $grid)
                            .id(UUID())
                            .padding(0)
                    }
                }
            }
            .padding(1)
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(grid: .constant(CAGrid(dim: 25)))
    }
}
