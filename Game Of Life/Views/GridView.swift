//
//  GridView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/19/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct GridView: View {
    @State var grid = CAGrid(dimensions: 5)
    
    var body: some View {
        VStack {
            CACellView(cell: $grid.grid[0])
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
