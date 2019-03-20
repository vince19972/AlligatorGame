//
//  ViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/15.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*-- MARK: create subviews --*/
        let CreateElement = ElementCreation()
        
        // input elements container
        let inputContainer =  UIView()
            self.view.addSubview(inputContainer)
            inputContainer
                .translatesAutoresizingMaskIntoConstraints = false
            inputContainer
                .centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            inputContainer
                .centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            inputContainer
                .heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
            inputContainer
                .widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        // name input textField
        let nameInput = CreateElement.textField(placehoderText: "please input your name")
            inputContainer.addSubview(nameInput)
            nameInput
                .centerXAnchor.constraint(equalTo: inputContainer.centerXAnchor).isActive = true
            nameInput
                .centerYAnchor.constraint(
                    equalTo: inputContainer.centerYAnchor,
                    constant: nameInput.frame.size.height / 2
                ).isActive = true
        
        // submit button
        let submitButton = CreateElement.submitButton(buttonText: "submit")
            inputContainer.addSubview(submitButton)
            submitButton
                .centerXAnchor.constraint(equalTo: inputContainer.centerXAnchor).isActive = true
            submitButton
                .topAnchor.constraint(
                    equalTo: nameInput.bottomAnchor,
                    constant: 12
                ).isActive = true
    }


}

