//
//  WinViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/25.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit

class SurviveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
            //background Image
            let surviveBackgroundImage = UIImageView(frame: UIScreen.main.bounds)
            surviveBackgroundImage.image = UIImage(named: "Survive")
            surviveBackgroundImage.contentMode = .scaleAspectFill
            self.view.insertSubview(surviveBackgroundImage, at: 0)
            
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
