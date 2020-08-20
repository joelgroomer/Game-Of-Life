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
    
    var body: some View {
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
