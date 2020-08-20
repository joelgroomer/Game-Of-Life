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
    @State private var offsetX: CGFloat = .zero
    @State private var offsetY: CGFloat = .zero

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            VStack {
                ForEach(0..<grid.dimensions, id: \.self) { i in
                    HStack {
                        ForEach(0..<self.grid.dimensions, id: \.self) { j in
                            CACellView(cell: self.grid.grid[i * self.grid.dimensions + j])
                        }
                    }
                }
            }
        .background(rectReader())
        }
    }
    
    func rectReader() -> some View {
        return GeometryReader { (geo) -> AnyView in
            let offsetX = -geo.frame(in: .global).minX
            let offsetY = -geo.frame(in: .global).minY

            if self.offsetX == .zero {
                DispatchQueue.main.async {
                    self.offsetX = offsetX
                }
            }
            if self.offsetY == .zero {
                DispatchQueue.main.async {
                    self.offsetY = offsetY
                }
            }
            return AnyView(Rectangle().fill(Color.clear))
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
