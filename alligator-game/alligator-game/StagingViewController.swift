//
//  StagingViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/20.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

//
/*-- MARK: delegate protocol --*/
//
protocol StagingViewDelegate {
    
    func startButtonTapped()
    
}

class StagingViewController: UIViewController {
    
    //
    /*-- MARK: class variables --*/
    //
    var connectedNumber = 0
    let connectedNumberLabel = UILabel()
    weak var startButton: UIButton!
    
    // delegate
    var delegate: StagingViewDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //
        /*-- MARK: create subviews --*/
        //
        let CreateElement = ElementCreation()
        
        // number label
        self.view.addSubview(connectedNumberLabel)
            connectedNumberLabel
                .translatesAutoresizingMaskIntoConstraints = false
            connectedNumberLabel
                .text = String(self.connectedNumber)
            connectedNumberLabel
                .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            connectedNumberLabel
                .centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // submit button
        startButton = CreateElement.submitButton(buttonText: "start")
            self.view.addSubview(startButton)
            startButton
                .centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            startButton
                .topAnchor.constraint(
                    equalTo: connectedNumberLabel.bottomAnchor,
                    constant: 12
                ).isActive = true
            startButton
                .layer.borderWidth = 0
            startButton
                .isEnabled = false
            startButton
                .addTarget(self, action: #selector(self.startButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    //
    /*-- MARK: submit button actions --*/
    //
    @objc func startButtonTapped(_ sender: UITapGestureRecognizer) -> Bool {
        view.endEditing(true)
        
        // function is delegated in ViewController
        self.delegate?.startButtonTapped()
        
        return false
    }
    
    
    //
    /*-- MARK: helper functions --*/
    //
    func updateConnectedNumber(_ connectedNumber: Int) {
        // update number
        self.connectedNumber += connectedNumber
        self.connectedNumberLabel.text = String(self.connectedNumber)
        
        // enable startButton if connected number reached threshold
        self.startButton.isEnabled = self.connectedNumber >= MinimumPlayerNumber
    }

}
