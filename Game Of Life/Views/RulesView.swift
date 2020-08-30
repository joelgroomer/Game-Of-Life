//
//  RulesView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/20/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct RulesView: View {

    var body: some View {
        VStack {
            Text("Conway's Game of Life")
                .font(.largeTitle)
            ScrollView {
                Text("""

John Conway, a British Mathemetician, created his reknowned "Game of Life" in 1970.
The "game" isn't really a game at all, but an example of a type of simulation known
as a "cellular automaton." This is my interpretation of this "game."

"""
                )
                .lineLimit(nil)
                Text("The Rules")
                    .font(.title)
                Text("""

A grid is displayed. Each 'square' on the grid is a cell. Cells may start as either 'alive' (filled in) or 'dead' (empty).

When the simulation is started, 'generations' begin to progress. Each generation results in a complete redrawing of the grid. The new grid is based on the rules below being applied to the previous grid.

1. A live cell with two or three living neighbors survives into the next generation.
2. A live cell with less than two or more than three living neighbors dies.
3. A dead cell with three living neighbors becomes a living cell in the next generation.
4. A dead cell with any other number of living neighbors remains dead.
"""
                     )
                Image("cellneighbors")
                Text("""
"Neighbors" here means any of the 8 adjacent cells. In the image above, the center (empty) cell has eight neighbors (the filled cells around it). A corner cell only has three neighbors, whereas a cell against one of the walls of the grid will have only five. On the "Options" tab, you have the ability to apply variations to the rules to see how they effect the game of life.
"""
                )
                Spacer()
                Link("Tap here to learn more about Conway's Game of Life", destination: URL(string: "https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life")!)
                    .foregroundColor(.white)
                    .padding()
                    .border(Color.white)
            }.padding()
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
