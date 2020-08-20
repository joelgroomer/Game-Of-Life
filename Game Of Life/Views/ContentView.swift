//
//  ContentView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSeg = 0
    @State private var gridScaleCurrent: CGFloat = 0
    @State private var gridScaleFinal: CGFloat = 1
    
    var body: some View {
        
        HStack {
            ZStack {
                Color(.lightGray)
                GridView()
                    .padding()
                    .scaleEffect(gridScaleFinal + gridScaleCurrent)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { amount in
                                self.gridScaleCurrent = amount - 1
                            }
                            .onEnded { amount in
                                self.gridScaleFinal += self.gridScaleCurrent
                                self.gridScaleCurrent = 0
                            }
                    )
            }
            
            ZStack {
                Color(.systemBlue)
                VStack {
                    Picker(selection: $selectedSeg,
                           label: Text("menu")) {
                            Text("Options").tag(0)
                            Text("Rules").tag(1)
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("Selection: \(selectedSeg)")
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
