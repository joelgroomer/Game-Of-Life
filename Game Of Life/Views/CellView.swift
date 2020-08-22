//
//  CellView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct CellView: View {
    @Binding var grid: CAGrid
    @State var index: Int
    
    var body: some View {
        Image(systemName: grid.grid[index] ?
                grid.alive : grid.dead)
            .onTapGesture {
                grid.grid[index].toggle()
            }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(grid: .constant(CAGrid(dim: 25)), index: 1)
    }
}
