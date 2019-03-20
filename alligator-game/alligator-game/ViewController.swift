//
//  ViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/15.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //
    /*-- MARK: global variables --*/
    //
    weak var nameInput: UITextField!
    

    //
    /*-- MARK: viewDidLoad --*/
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        /*-- MARK: create subviews --*/
        //
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
        nameInput = CreateElement.textField(placehoderText: "please input your name")
            inputContainer.addSubview(nameInput)
            nameInput
                .centerXAnchor.constraint(equalTo: inputContainer.centerXAnchor).isActive = true
            nameInput
                .centerYAnchor.constraint(
                    equalTo: inputContainer.centerYAnchor,
                    constant: nameInput.frame.size.height / 2
                ).isActive = true
            nameInput.delegate = self
        
        // submit button
        let submitButton = CreateElement.submitButton(buttonText: "submit")
            inputContainer.addSubview(submitButton)
            submitButton
                .centerXAnchor.constraint(equalTo: inputContainer.centerXAnchor).isActive = true
            submitButton.layer.borderWidth = 0
            submitButton
                .topAnchor.constraint(
                    equalTo: nameInput.bottomAnchor,
                    constant: 12
                ).isActive = true
            submitButton.addTarget(self, action: #selector(self.submitButtonPressed(_:)), for: .touchUpInside)
    }
    
    //
    /*-- MARK: submit button actions --*/
    //
    @objc func submitButtonPressed(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        
        // Check text field is not empty, otherwise save to user defaults.
        if (self.nameInput.text?.isEmpty)! {
            AlertMessage().present(viewController: self, message: "Enter Valid Player Id")
        } else {
            print(self.nameInput.text!)
        }
    }
    
    //
    /*-- MARK: textField actions --*/
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)

        return false
    }


}

