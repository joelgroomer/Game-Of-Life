//
//  GridView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/19/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct GridView: View {
    @State var grid = CAGrid(dimensions: 25)
    
    var body: some View {
        VStack {
            ForEach(0..<grid.dimensions, id: \.self) { i in
                HStack {
                    ForEach(0..<self.grid.dimensions, id: \.self) { j in
                        CACellView(cell: self.grid.grid[i * self.grid.dimensions + j])
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
