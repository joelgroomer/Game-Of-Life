//
//  OptionsView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/25/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct OptionsView: View {
    @EnvironmentObject var cagridController: CAGridController
    @State private var shapes = [
        Shape(offName: "square", onName: "square.fill", selected: true, title: "Square", type: .system),
        Shape(offName: "circle", onName: "circle.fill", selected: false, title: "Circle", type: .system),
        Shape(offName: "moon", onName: "sun.max.fill", selected: false, title: "Night/Day", type: .system),
        Shape(offName: "🥶", onName: "🥵", selected: false, title: "Hot & Cold", type: .emoji)
    ]
    
    var body: some View {
        ScrollView {
            Text("Options")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text("Cell shapes:")
                    .font(.title2)
                HStack {
                    ForEach(0..<shapes.count) { shape in
                        CellShapeView(shape: $shapes[shape])
                            .onTapGesture {
                                for i in 0..<shapes.count {
                                    shapes[i].selected = false
                                }
                                shapes[shape].selected = true
                                cagridController.alive = shapes[shape].onName
                                cagridController.dead = shapes[shape].offName
                                cagridController.shapeType = shapes[shape].type
                            }
                    }
                }
                Text("Starting board:")
                    .font(.title2)
                
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
