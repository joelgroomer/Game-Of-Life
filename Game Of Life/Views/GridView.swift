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
    @EnvironmentObject private var cagridController: CAGridController
    
    var body: some View {
            
        LazyVGrid(columns: columns) {
            ForEach(0..<cagridController.cagrid.dim * cagridController.cagrid.dim, id: \.self) { i in
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
