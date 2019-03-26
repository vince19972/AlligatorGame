//
//  ElementCreation.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/20.
//  Copyright © 2019 vinceshao. All rights reserved.
//

// Q:   What's this file for?
// A:   This class is a collection of element (subview) instantiations.
//      Wrap the action of creating an element in a function in class ElementCreation,
//      and call the function to instantiate it in required files.

import Foundation
import UIKit

class ElementCreation {

    //
    /*-- background --*/
    //
    func backgroundImage(_ imageName: String) -> UIImageView {
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage(named: imageName)
        background.contentMode = UIView.ContentMode.scaleAspectFill
        
        return background
    }
    
    //
    /*-- image --*/
    //
    func imageAsset(_ imageName: String) -> UIImageView {
        let image = UIImageView(image: UIImage(named: imageName))
        image.contentMode = UIView.ContentMode.scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }
    
    //
    /*-- textField --*/
    //
    func textField(placehoderText: String) -> TextField {
        let textField = TextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        textField.textColor = UIColor.gray
        textField.attributedPlaceholder = NSAttributedString(
            string: placehoderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
        textField.returnKeyType = UIReturnKeyType.done
        
        return textField
    }
    
    //
    /*-- submit button --*/
    //
    func submitButton(buttonText: String, buttonImage: String? = nil) -> UIButton {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        if buttonImage != nil {
            button.setImage(UIImage(named: buttonImage!), for: .normal)
            button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        } else {
            button.setTitle(buttonText, for: .normal)
            button.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
            button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        }
        
        return button
    }
    
}


/* MARK: textField padding helper class */
class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
