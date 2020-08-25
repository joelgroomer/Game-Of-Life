//
//  CellView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct CellView: View {

    @State var alive: Bool
    @Binding var grid: CAGrid
    @State var index: Int
    
    var body: some View {

        if $alive.wrappedValue {
            Image(systemName: grid.alive)
                .onTapGesture {
                    grid.setCell(index: index, value: false)
                    $alive.wrappedValue.toggle()
                }
        } else {
            Image(systemName: grid.dead)
                .onTapGesture {
                    grid.setCell(index: index, value: true)
                    $alive.wrappedValue.toggle()
                }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(alive: false, grid: .constant(CAGrid(dim: 25)), index: 1)
    }
}
