//
//  ViewController.swift
//  KVOBlogPost
//
//  Created by Patrick O'Leary on 7/24/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
    let label = UILabel()
    let patClock = PatClock()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addObserver(self, forKeyPath: #keyPath(patClock.count), options: [.new, .old, .initial], context: nil)
        patClock.startTimer()
    }
    
    func setup() {

        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        label.text = "Dumb"
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("bserved value changed")
        if keyPath == #keyPath(patClock.count) {
            print("keypath changed")
            label.text = String(patClock.count)
        }
    }


}




