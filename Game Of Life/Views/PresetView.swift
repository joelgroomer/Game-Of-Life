//
//  PresetView.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/26/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import SwiftUI

struct Preset {
    var title: String
    var imageName: String
    var selected: Bool
}

struct PresetView: View {
    @EnvironmentObject var cagridController: CAGridController
    @EnvironmentObject var gen: GenerationController
    @State var selectedPreset = 0
    
    var body: some View {
        Picker("Preset", selection: $selectedPreset) {
            ForEach(0..<cagridController.presets.count) {
                Text(cagridController.presets[$0])
            }
        }
        .onChange(of: selectedPreset, perform: { value in
            gen.reset()
            cagridController.changeGrid(presetIndex: value)
            
        })
    }
}

struct PresetView_Previews: PreviewProvider {
    static var previews: some View {
        PresetView()
    }
}
