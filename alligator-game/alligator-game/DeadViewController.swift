//
//  DeadViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/25.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

class DeadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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


        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


