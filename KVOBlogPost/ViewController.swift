//
//  ViewController.swift
//  KVOBlogPost
//
//  Created by Patrick O'Leary on 7/24/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewModelDelegate {
    
 
    let label = UILabel()
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        viewModel.delegate = self
        viewModel.startObserving()
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
    
    @IBAction func buttonTapped(_ sender: Any) {
        viewModel.timerChange()
    }
    
    func update(text: String) {
        label.text = text
    }

}






