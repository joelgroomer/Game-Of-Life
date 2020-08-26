//
//  CellShapeView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/25/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct CellShapeView: View {
    @Binding var shape: Shape
    var body: some View {
        VStack {
            Text(shape.title)
            HStack {
                if shape.type == .system {
                    Image(systemName: shape.offName)
                    Image(systemName: shape.onName)
                } else if shape.type == .asset {
                    Image(shape.offName)
                    Image(shape.onName)
                } else {
                    Text(shape.offName)
                    Text(shape.onName)
                }
            }
            .padding(1)
        }
        .padding()
        .border(Color.black, width: 2.0)
        .cornerRadius(5.0)
        .background(shape.selected ? Color.green : Color.clear)
    }
}

struct CellShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CellShapeView(shape: .constant(Shape(offName: "moon.stars.fill", onName: "sun.max", selected: true, title: "Night/Day", type: .system)))
    }
}
