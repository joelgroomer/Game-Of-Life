//
//  SizeView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/27/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct SizeView: View {
    @EnvironmentObject var cagridController: CAGridController
    @EnvironmentObject var gen: GenerationController
    @State var dim: Int = 25
    
    var body: some View {
        Picker("Grid Size", selection: $dim) {
            ForEach(10..<51) {
                Text("\($0 - 10) x \($0 - 10)")
            }
        }.onChange(of: dim, perform: { value in
            gen.reset()
            cagridController.changeGridSize(dim: value)
        })
    }
}

struct SizeView_Previews: PreviewProvider {
    static var previews: some View {
        SizeView()
    }
}
