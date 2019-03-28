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
    weak var startButton: UIButton!
    
    // delegate
    var delegate: StagingViewDelegate?
    
    // instantiate child views
    let stagingBarViewController = StagingBarViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //
        /*-- MARK: create subviews --*/
        //
        let CreateElement = ElementCreation()
        
        // background image
        let backgroundImage = CreateElement.backgroundImage("staging_background")
            self.view.addSubview(backgroundImage)
        
        // top container
        let topContainer = UIView()
            self.view.addSubview(topContainer)
            topContainer
                .translatesAutoresizingMaskIntoConstraints = false
            topContainer
                .centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            topContainer
                .topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            topContainer
                .heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.8).isActive = true
            topContainer
                .widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        // alligator
        let alligator = CreateElement.imageAsset("staging_alligator")
            topContainer
                .addSubview(alligator)
            alligator
                .centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
            alligator
                .bottomAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive = true
            alligator
                .heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.3).isActive = true
        
        // submit button
        startButton = CreateElement.submitButton(buttonText: "start", buttonImage: "staging_start-btn")
            topContainer.addSubview(startButton)
            startButton
                .centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            startButton
                .bottomAnchor.constraint(equalTo: alligator.topAnchor, constant: -24).isActive = true
            startButton
                .heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.1).isActive = true
            startButton
                .layer.borderWidth = 0
//            startButton
//                .isEnabled = false
            startButton
                .addTarget(self, action: #selector(self.startButtonTapped(_:)), for: .touchUpInside)
        
        // bottom bar
        addChild(stagingBarViewController)
            self.view.addSubview(stagingBarViewController.view)
            stagingBarViewController
                .didMove(toParent: self)
            stagingBarViewController
                .view.translatesAutoresizingMaskIntoConstraints = false
            stagingBarViewController
                .view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            stagingBarViewController
                .view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            stagingBarViewController
                .view.heightAnchor.constraint(equalToConstant: self.view.frame.height * 0.2).isActive = true
            stagingBarViewController
                .view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
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
        ConnectedNumber = self.stagingBarViewController.updateConnectedNumber(connectedNumber)
        
        // enable startButton if connected number reached threshold
        self.startButton.isEnabled = ConnectedNumber >= MinimumPlayerNumber

    }

}
