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
        Shape(offName: "🥶", onName: "🥵", selected: false, title: "Hot & Cold", type: .emoji),
        Shape(offName: "🥚", onName: "🐥", selected: false, title: "Eggs & Chicks", type: .emoji),
        Shape(offName: "🌧", onName: "☀️", selected: false, title: "Sun vs Rain", type: .emoji),
        Shape(offName: "😼", onName: "🐭", selected: false, title: "Cat vs Mouse", type: .emoji)
    ]
    
    var body: some View {
        ScrollView {
            Text("Options")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text("Cell shapes:")
                    .font(.title2)
                ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
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
                }
                Text("Initial boards:")
                    .font(.title2)
                PresetView()
                Text("Grid size:")
                    .font(.title2)
                SizeView()
            }
        }
        .padding()
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
