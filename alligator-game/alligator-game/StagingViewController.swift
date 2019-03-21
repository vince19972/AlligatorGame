//
//  StagingViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/20.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

class StagingViewController: UIViewController {
    
    //
    /*-- MARK: class variables --*/
    //
    var connectedNumber = 0
    let connectedNumberLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(connectedNumberLabel)
            connectedNumberLabel
                .translatesAutoresizingMaskIntoConstraints = false
            connectedNumberLabel
                .text = String(self.connectedNumber)
            connectedNumberLabel
                .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            connectedNumberLabel
                .centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    //
    /*-- MARK: helper functions --*/
    //
    func updateConnectedNumber(_ connectedNumber: Int) {
        self.connectedNumber = connectedNumber
        self.connectedNumberLabel.text = String(self.connectedNumber)
    }

}
