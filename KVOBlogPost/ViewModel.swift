//
//  ViewModel.swift
//  KVOBlogPost
//
//  Created by Patrick O'Leary on 8/9/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    let patClock = PatClock()
    var delegate: ViewModelDelegate?
    
    
    func startObserving() {
        addObserver(self, forKeyPath: #keyPath(patClock.count), options: [.new, .old, .initial], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("bserved value changed")
        if keyPath == #keyPath(patClock.count) {
            print("keypath changed")
            delegate?.update(text: String(patClock.count))
        }
    }
    
    func timerChange() {
        patClock.running = !patClock.running
    }
}

protocol ViewModelDelegate {
    func update(text: String)
}
