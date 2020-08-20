//
//  ContentView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/18/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            GridView()
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Simulation")
            }
            Text("Options")
            .tabItem {
                Image(systemName: "slider.horizontal.3")
                Text("Options")
            }
            Text("Rules")
            .tabItem {
                Image(systemName: "questionmark.circle")
                Text("Rules")
            }
            
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
