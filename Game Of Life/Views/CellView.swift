//
//  CellView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct CellView: View {
    @EnvironmentObject var gen: GenerationController
    @EnvironmentObject var cagridController: CAGridController
    @State var alive: Bool
    @State var index: Int
    
    var body: some View {
        let tap = TapGesture(count: 1)
            .onEnded { _ in
                if !gen.running {
                    cagridController.cagrid.setCell(index: index, value: nil)
                    $alive.wrappedValue.toggle()
                }
            }

        if index < cagridController.cagrid.grid.count {
            if cagridController.shapeType == .system {
                Image(systemName: cagridController.cagrid.grid[index] ? cagridController.alive : cagridController.dead)
                    .gesture(tap)
            } else if cagridController.shapeType == .asset {
                Image(cagridController.cagrid.grid[index] ? cagridController.alive : cagridController.dead)
                    .gesture(tap)
            } else {
                Text(cagridController.cagrid.grid[index] ? cagridController.alive : cagridController.dead)
                    .font(.caption)
                    .frame(width: 20, height: 25, alignment: .center)
                    .gesture(tap)
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(alive: false, index: 1)
    }
}
