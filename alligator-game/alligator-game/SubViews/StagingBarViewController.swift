//
//  StagingBarViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/26.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

class StagingBarViewController: UIViewController {
    
    //
    /*-- MARK: class variables --*/
    //
    var connectedNumber = 0
    let connectedNumberLabel = UILabel()
    let progressBar = UIView()
    let progressPortion: CGFloat = CGFloat(1) / CGFloat(15)
    var progressBarWidthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.backgroundColor = UIColor(red:0.82, green:0.80, blue:0.71, alpha:1.0).cgColor
        
        self.view.addSubview(progressBar)
            progressBarWidthConstraint = progressBar.widthAnchor.constraint(equalToConstant: 0)
            progressBar
                .layer.backgroundColor = UIColor(red:0.96, green:0.88, blue:0.28, alpha:1.0).cgColor
            progressBar
                .translatesAutoresizingMaskIntoConstraints = false
            progressBar
                .topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            progressBar
                .leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            progressBar
                .heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
            progressBar
                .addConstraint(progressBarWidthConstraint)
        
        self.view.addSubview(connectedNumberLabel)
            connectedNumberLabel
                .translatesAutoresizingMaskIntoConstraints = false
            connectedNumberLabel
                .text = "\(String(self.connectedNumber))/\(MinimumPlayerNumber) players are connected"
            connectedNumberLabel
                .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            connectedNumberLabel
                .centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func updateConnectedNumber(_ connectedNumber: Int) -> Int {
        // update text
        self.connectedNumber += connectedNumber
        self.connectedNumberLabel.text = self.connectedNumber <= MinimumPlayerNumber
            ? "\(String(self.connectedNumber))/\(MinimumPlayerNumber) players are connected"
            : "All players connected!"
        
        // update progress bar
        let floatConnectedNumber = CGFloat(self.connectedNumber)
        progressBarWidthConstraint.constant = self.view.frame.width * progressPortion * floatConnectedNumber
        progressBar.layoutIfNeeded()
        
        return self.connectedNumber
    }

}
