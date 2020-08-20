//
//  CACellView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/19/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct CACellView: View {
    @Binding var cell: CACell
    
    var body: some View {
        if cell.isAlive {
            return Image(systemName: "square.fill")
        } else {
            return Image(systemName: "square")
        }
    }
}

struct CACellView_Previews: PreviewProvider {
    static var previews: some View {
        CACellView(cell: Binding.constant(CACell()))
    }
}
