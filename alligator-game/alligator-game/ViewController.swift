//
//  ViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/15.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //background Image
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //background Image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "deadBackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //Deadsign
        let deadsignImage = UIImageView(frame: UIScreen.main.bounds)
        deadsignImage.image = UIImage(named: "deadSign")
        deadsignImage.contentMode = .scaleAspectFill
        self.view.addSubview(deadsignImage)
        
        //alligator Image - always on the right bottom corner
        let alligatorImage = UIImageView(frame: UIScreen.main.bounds)
        alligatorImage.image = UIImage(named: "deadAlligator")
        alligatorImage.contentMode = .bottomRight
        self.view.addSubview(alligatorImage)
        
        
        //get image (alligator's) heigh and width
        let alligatorImageViewHeight = alligatorImage.image!.size.height
        let alligatorImageViewWidth: CGFloat = alligatorImage.image!.size.width
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
//        //get image (alligator's) heigh and width
//        let alligatorImageViewHeight = alligatorImage.image!.size.height
//        let alligatorImageViewWidth: CGFloat = alligatorImage.image!.size.width
//        let screenHeight = UIScreen.main.bounds.height
//        let screenWidth = UIScreen.main.bounds.width

//    let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//    backgroundImage.image = UIImage(named: "deadBackground")
//    backgroundImage.contentMode = .scaleAspectFill
//    self.view.insertSubview(backgroundImage, at: 0)
    
//    @IBOutlet weak var deadBackground: UIImageView!
//    @IBOutlet weak var deadAlligator: UIImageView!
//    @IBOutlet weak var deadSign: UIImageView!
//    @IBOutlet weak var tryagainButton: UIButton!
//    @IBOutlet weak var exitButton: UIButton!
//    @IBOutlet weak var deadblood: UIImageView!
//    var player: AVAudioPlayer?
//
//
//    // Make the device vibrate.
//    func generateImpactFeedback() {
//        let generator = UIImpactFeedbackGenerator(style: .heavy)
//        generator.impactOccurred()
//    }
//
//    // Play a mp3 sound file.
//    func playSoundMP3(filename: String) {
//        guard let url = Bundle.main.url(forResource: filename, withExtension: "mp3") else { return }
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)), mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            guard let player = player else { return }
//            player.play()
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//}
//
//
//// Helper function inserted by Swift 4.2 migrator.
//fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
//    return input.rawValue
//}
////
//
}
}
