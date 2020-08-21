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
//    @State private var offsetX: CGFloat = .zero
//    @State private var offsetY: CGFloat = .zero
    @State private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 25)
    @State private var scale: CGFloat = 0.5
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "minus.magnifyingglass")
                Slider(value: $scale)
                Image(systemName: "plus.magnifyingglass")
            }
            .padding()
            
            ScrollView([.horizontal, .vertical], showsIndicators: true) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<grid.dimensions, id: \.self) { i in
                        ForEach(0..<self.grid.dimensions) { j in
                            CACellView(cell: self.grid.grid[i * self.grid.dimensions + j])
                                .id(UUID())
                        }
                    }
                }
                .scaleEffect(scale * 2)
                .highPriorityGesture(
                    MagnificationGesture()
                        .onChanged { value  in
                            scale = value.magnitude
                        })
            }
            Text("Grid size: \(grid.dimensions) x \(grid.dimensions)")
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
