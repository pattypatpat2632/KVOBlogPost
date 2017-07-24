//
//  ViewController.swift
//  KVOBlogPost
//
//  Created by Patrick O'Leary on 7/24/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UIStepper()
    let label = UILabel()
    var textHolder = TextHolder()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addObserver(self, forKeyPath: #keyPath(textHolder.text), options: [.new, .old, .initial], context: nil)
       
    }
    
    func setup() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        textField.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        label.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        label.text = "Dumb"
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("bserved value changed")
        if keyPath == #keyPath(textHolder.text) {
            print("keypath changed")
            label.text = textHolder.text
        }
    }
    
    func stepperChanged() {
        textHolder.text = String(textField.value)
    }


}




