//
//  PatClock.swift
//  KVOBlogPost
//
//  Created by Patrick O'Leary on 8/1/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation

class PatClock: NSObject {
    dynamic var count: Int = 0
    var timer =  Timer()
    var running: Bool = false {
        didSet {
            if running {
                startTimer()
            } else {
                stopTimer()
            }
        }
    }
    
    func startTimer() {
        print("TIMER STARTED")
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            self.count += 1
            print(self.count)
        })
    }
    
    func stopTimer() {
        timer.invalidate()
    }
}
