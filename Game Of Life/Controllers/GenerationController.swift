//
//  GenerationController.swift
//  Game Of Life
//
//  Created by Joel Groomer on 8/21/20.
//  Copyright © 2020 Julltron. All rights reserved.
//

import Foundation

class GenerationController: ObservableObject {
    private var timer: Timer?

    @Published var generation: Int = 0
    
    @Published var running: Bool = false { didSet {
        if running {
            timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(pinged), userInfo: nil, repeats: true)
        } else {
            timer?.invalidate()
        }
    }}
    
    var speed: TimeInterval = 1.0 { didSet {
        if running == true {
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(pinged), userInfo: nil, repeats: true)
        }
    }}
    

    @objc func pinged() {
        generation += 1
        NotificationCenter.default.post(Notification(name: (NSString("generation")) as Notification.Name))
    }
    
    func startStop() {
        running = !running
    }
    
    func reset() {
        if running {
            startStop()
        }
        generation = 0
    }

}
