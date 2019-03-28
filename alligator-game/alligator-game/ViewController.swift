//
//  ViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/15.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit
import AVFoundation

//
/*-- MARK: delegate protocol --*/
//
//protocol GameViewDelegate: class {
//    func TryagainButtonTapped()
//    func ExitButtonTapped()
//
    class ViewController: UIViewController {
    //background Image
//            weak var tryAgainButton: UIButton!
    
        override func viewDidLoad() {
            super.viewDidLoad()
//            let CreateElement = ElementCreation()
            
        //background Image
        let deadbackgroundImage = UIImageView(frame: UIScreen.main.bounds)
        deadbackgroundImage.image = UIImage(named: "deadBackground")
        deadbackgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(deadbackgroundImage, at: 0)
        
        //Deadsign
        let deadsignImage = UIImageView(frame: CGRect(x: (view.bounds.width/2), y: view.bounds.height/3, width: 180, height: 67))
        deadsignImage.image = UIImage(named: "deadSign")
        self.view.addSubview(deadsignImage)
       deadsignImage.translatesAutoresizingMaskIntoConstraints = true
        deadsignImage.center = CGPoint(x: (view.bounds.width/2), y: view.bounds.height/3-30)
        deadsignImage.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]

            //deadAlligator
            let deadalligatorImage = UIImageView(frame: CGRect(x: (view.bounds.width/2), y: view.bounds.height/3, width: 770, height: 400))
            deadalligatorImage.image = UIImage(named: "deadAlligator2")
            self.view.addSubview(deadalligatorImage)
            deadalligatorImage.translatesAutoresizingMaskIntoConstraints = true
            deadalligatorImage.center = CGPoint(x: (view.bounds.width/2+22), y: view.bounds.height/3+55)
            deadalligatorImage.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]


}

}
