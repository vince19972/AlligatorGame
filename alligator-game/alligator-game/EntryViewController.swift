//
//  BaseViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/20.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

//
/*-- MARK: delegate protocol --*/
//
protocol EntryViewDelegate {
    
    func submitButtonTapped(nameInput: UITextField)
    
}

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    //
    /*-- MARK: class variables --*/
    //
    // subviews
    weak var nameInput: UITextField!
    
    // delegate
    var delegate: EntryViewDelegate?

    // viewDidLoad
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
        submitButton
            .topAnchor.constraint(
                equalTo: nameInput.bottomAnchor,
                constant: 12
            ).isActive = true
        submitButton
            .layer.borderWidth = 0
        submitButton
            .addTarget(self, action: #selector(self.submitButtonTapped(_:)), for: .touchUpInside)
    }
    
    //
    /*-- MARK: submit button actions --*/
    //
    @objc func submitButtonTapped(_ sender: UITapGestureRecognizer) -> Bool {
        view.endEditing(true)
        
        // function is delegated in ViewController
        self.delegate?.submitButtonTapped(nameInput: self.nameInput)
        
        return false
    }
    
    //
    /*-- MARK: textField actions --*/
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return false
    }

}
