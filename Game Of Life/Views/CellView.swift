//
//  CellView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct CellView: View {
    @EnvironmentObject var cagrid: CAGrid
    @State var alive: Bool
    @State var index: Int
    
    var body: some View {

        if cagrid.grid[index] {
            Image(systemName: cagrid.alive)
                .onTapGesture {
                    cagrid.setCell(index: index, value: false)
                    $alive.wrappedValue.toggle()
                }
        } else {
            Image(systemName: cagrid.dead)
                .onTapGesture {
                    cagrid.setCell(index: index, value: true)
                    $alive.wrappedValue.toggle()
                }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(alive: false, index: 1)
    }
}
