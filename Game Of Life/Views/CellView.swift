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
        let tap = TapGesture(count: 1)
            .onEnded { _ in
                cagrid.setCell(index: index, value: true)
                $alive.wrappedValue.toggle()
            }

        if cagrid.shapeType == .system {
            Image(systemName: cagrid.grid[index] ? cagrid.alive : cagrid.dead)
                .gesture(tap)
        } else if cagrid.shapeType == .asset {
            Image(cagrid.grid[index] ? cagrid.alive : cagrid.dead)
                .gesture(tap)
        } else {
            Text(cagrid.grid[index] ? cagrid.alive : cagrid.dead)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(alive: false, index: 1)
    }
}
