//
//  GridDisplayView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/19/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct GridDisplayView: View {
    @EnvironmentObject private var gen: GenerationController
    @EnvironmentObject private var cagrid: CAGrid
//    @State private var offsetX: CGFloat = .zero
//    @State private var offsetY: CGFloat = .zero
    
    @State private var scale: CGFloat = 0.5
    @State private var speed: TimeInterval = 0.5 { didSet {
        if speed > 0 {
            gen.speed = 0.5 / speed
        } else {
            gen.speed = 5.0
        }
    }}
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "minus.magnifyingglass")
                Slider(value: $scale)
                Image(systemName: "plus.magnifyingglass")
            }
            .padding()
            
            ScrollView([.horizontal, .vertical], showsIndicators: true) {
                GridView()
                .scaleEffect(scale * 2)
                .highPriorityGesture(
                    MagnificationGesture()
                        .onChanged { value  in
                            scale = value.magnitude
                        })
            }
            HStack {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        gen.reset()
                        cagrid.reset()
                    }
                    .font(.title)
                VStack {
                    Text("Generation: \(gen.generation)")
                    Text("Grid size: \(cagrid.dim) x \(cagrid.dim)")
                }
                .padding()
                Image(systemName: gen.running ? "stop.fill" : "play.fill")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        gen.startStop()
                    }
                    .font(.title)
            }
            Spacer()
            HStack {
                
                Image(systemName: "tortoise")
                Slider(value: $speed)
                Image(systemName: "hare")
                
            }
            .padding()
        }
    }
}

struct GridDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        GridDisplayView()
    }
}
