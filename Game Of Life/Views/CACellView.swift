//
//  CACellView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/19/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct CACellView: View {
    @ObservedObject var cell: CACell
    @EnvironmentObject var gen: GenerationController
    
    var body: some View {
        if gen.generation > 0 {
            cell.updateGen()
        }
        
        let imgName: String
        if cell.isAlive {
            imgName = "square.fill"
        } else {
            imgName = "square"
        }
        return Image(systemName: imgName)
            .onTapGesture {
                self.cell.toggle()
        }
    }
}

struct CACellView_Previews: PreviewProvider {
    static var previews: some View {
        CACellView(cell: CACell())
    }
}
