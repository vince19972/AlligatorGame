//
//  SurivedViewController.swift
//  alligator-game
//
//  Created by Anna Oh on 27/3/2019.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit
import AVFoundation

class SurivedViewController: UIViewController {
//    @IBOutlet weak var survivedBackgroud: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //background Image
        let deadbackgroundImage = UIImageView(frame: UIScreen.main.bounds)
        deadbackgroundImage.image = UIImage(named: "deadBackground")
        deadbackgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(deadbackgroundImage, at: 0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
