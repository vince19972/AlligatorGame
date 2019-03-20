//
//  StagingViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/20.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

class StagingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let connectedCount: UILabel = {
            let label = UILabel()
        
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "0"
            
            return label
        }()
        
        self.view.addSubview(connectedCount)
        connectedCount.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        connectedCount.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

}
