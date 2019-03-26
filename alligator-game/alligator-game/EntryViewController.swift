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
        
        // background image
        let backgroundImage = CreateElement.backgroundImage("entry_background")
        self.view.addSubview(backgroundImage)
        
        // input elements container
        let inputContainer = UIView()
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
        
        // game title
        let gameTitle = CreateElement.imageAsset("entry_title")
        inputContainer
            .addSubview(gameTitle)
        gameTitle
            .centerXAnchor.constraint(equalTo: inputContainer.centerXAnchor).isActive = true
        gameTitle
            .topAnchor.constraint(equalTo: inputContainer.topAnchor, constant: 64).isActive = true
        gameTitle
            .heightAnchor.constraint(equalToConstant: self.view.frame.height / 4).isActive = true
        
        
        // name input textField
        nameInput = CreateElement.textField(placehoderText: "type your name")
        inputContainer
            .addSubview(nameInput)
        nameInput
            .centerXAnchor.constraint(equalTo: inputContainer.centerXAnchor).isActive = true
        nameInput
            .topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 32).isActive = true
        nameInput
            .widthAnchor.constraint(equalToConstant: self.view.frame.width / 2).isActive = true
        nameInput.delegate = self
        
        // submit button
        let submitButton = CreateElement.submitButton(buttonText: "submit", buttonImage: "entry_submit-btn")
        inputContainer
            .addSubview(submitButton)
        submitButton
            .centerXAnchor.constraint(equalTo: inputContainer.centerXAnchor).isActive = true
        submitButton
            .topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 12).isActive = true
        submitButton
            .widthAnchor.constraint(equalToConstant: self.view.frame.width / 5).isActive = true
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
