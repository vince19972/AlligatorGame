//
//  GameViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/20.
//  Copyright © 2019 vinceshao. All rights reserved.
//

import UIKit
var userNum:Int = 16 // the user number will depends on Vince's code, the string of users, and count the string.?

//
/*-- MARK: delegate protocol --*/
//
protocol GameViewDelegate: class {
    func updateDeath()
    func updateSurvive()
    
}


class GameViewController: UIViewController {
    
    var count = 0
    var innerCount = 0
    var innerCount2 = 0
    var deathCount = 0
    var notdiedCount = 0
    var death = false
//    var timer = Timer()
//    var progressView: UIProgressView?

    //life view test, will replace with Anna's UI file
    

    // delegate
    weak var delegate: GameViewDelegate?
    
     var random_sequence = [] as [Int]
    

    
    var layers = [] as [CAShapeLayer]
    //let lifes = [] as [UIImageView]
    let life = UIImageView(frame: CGRect(x:10 + 30, y:100, width:30, height:20))
    let life2 = UIImageView(frame: CGRect(x:10 + 60, y:100, width:30, height:20))
    let life3 = UIImageView(frame: CGRect(x:10 + 90, y:100, width:30, height:20))
    let life4 = UIImageView(frame: CGRect(x:10 + 120, y:100, width:30, height:20))
    let life5 = UIImageView(frame: CGRect(x:10 + 150, y:100, width:30, height:20))

    
    var teethOffset = 350/userNum*2-10
    var teethOffset2 = 350/10.5
    var x2 = 220.0
    //let x3 = x2 + teethOffset
    var x1 = 0.0
    var x3 = 0.0
    var y1 = 332.5
    var y2 = 378.5
    var y3 = 378.5
    //upper teeth position set
    var xx1 = 268.49
    var xx2 = 268.49
    var xx3 = 305.49
    var yy1 = 214.4
    var yy2 = 267.4
    var yy3 = 226.4
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNum = ConnectedNumber + 5
        random_sequence = Array(0...userNum-1)
        random_sequence.shuffle()
        //background Image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "playingBackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //alligator Image - always on the right bottom corner
        let alligatorImage = UIImageView(frame: UIScreen.main.bounds)
        alligatorImage.image = UIImage(named: "playingAlligator")
        alligatorImage.contentMode = .bottomRight
        self.view.addSubview(alligatorImage)
        showLife()
        


        //get image (alligator's) heigh and width
        let alligatorImageViewHeight = alligatorImage.image!.size.height
        let alligatorImageViewWidth: CGFloat = alligatorImage.image!.size.width
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        let mathForTeethPosition1 = screenHeight - alligatorImageViewHeight
        let mathForTeethPosition2 = screenWidth - alligatorImageViewWidth
        
        x2 = 124.0 + Double(mathForTeethPosition2)
        y2 = Double(screenHeight) - 35.5
        y3 = y2
        y1 = y2 - 46.0
    
        xx1 = 172.49 + Double(mathForTeethPosition2)
        yy1 = Double(screenHeight) - 199.6
        xx2 = xx1
        xx3 = xx1 + 37
        yy2 = yy1 + 53
        yy3 = yy1 + 12
        
        x3 = x2 + Double(teethOffset)
        x1 = x2 + Double(teethOffset)/2
        //math the teeth position
        
        drawTeeth()
        
        
        //challange: make the layer a string, and append the string?
        for i in 0...userNum-1{
            self.view.layer.addSublayer(layers[i])
        }


    }
    

    

        
    func drawTeeth(){
   
        let color = UIColor.white

        //loop the teeth drawing
        for i:Int in 0...userNum{
            // teeth 1 Bezier Drawing
            let bezierPath = UIBezierPath()
            
            //            Double offset = Double(i)
            let temp_x1 = x1 + Double(i)*Double(teethOffset)
            let temp_x2 = x2 + Double(i)*Double(teethOffset)
            let temp_x3 = x3 + Double(i)*Double(teethOffset)
            
            let temp_xx1 = xx1 + Double(i)*Double(teethOffset2)
            let temp_xx2 = xx2 + Double(i)*Double(teethOffset2)
            let temp_xx3 = xx3 + Double(i)*Double(teethOffset2)
            let temp_yy1 = yy1 + Double(i)*10.3
            let temp_yy2 = yy2 + Double(i)*10.3
            let temp_yy3 = yy3 + Double(i)*10.3
            
            
            bezierPath.move(to: CGPoint(x: temp_x1 , y: y1))
            bezierPath.addLine(to: CGPoint(x: temp_x2, y: y2))
            bezierPath.addLine(to: CGPoint(x: temp_x3, y: y3))
            
            let bezierPath2 = UIBezierPath()
            
            bezierPath2.move(to: CGPoint(x: temp_xx1 , y: temp_yy1))
            bezierPath2.addLine(to: CGPoint(x: temp_xx2, y: temp_yy2))
            bezierPath2.addLine(to: CGPoint(x: temp_xx3, y: temp_yy3))
            
            bezierPath.close()
            color.setFill()
            bezierPath.fill()
            UIColor.gray.setStroke()
            bezierPath.lineWidth = 1
            bezierPath.stroke()
            let layer = CAShapeLayer()
            layer.path = bezierPath.cgPath
            layer.fillColor = color.cgColor
            layer.strokeColor = UIColor.clear.cgColor
            layers.append(layer)
            
            bezierPath2.close()
            color.setFill()
            bezierPath2.fill()
            UIColor.gray.setStroke()
            bezierPath2.lineWidth = 1
            bezierPath2.stroke()
            let layer2 = CAShapeLayer()
            layer2.path = bezierPath2.cgPath
            layer2.fillColor = color.cgColor
            layer2.strokeColor = UIColor.clear.cgColor
            layers.append(layer2)
            
        }
    }

    
        
    func showLife(){
        
        //life 1
        life.image = UIImage(named:"LifeIcon")
        self.view.addSubview(life)
        life.translatesAutoresizingMaskIntoConstraints = true
        life.center = CGPoint(x: view.bounds.width/7, y: view.bounds.height/7)
        life.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]

        //life 2
        life2.image = UIImage(named:"LifeIcon")
        self.view.addSubview(life2)
        life2.translatesAutoresizingMaskIntoConstraints = true
        life2.center = CGPoint(x: (view.bounds.width/7)+40, y: view.bounds.height/7)
        life2.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]

        //life 3
        life3.image = UIImage(named:"LifeIcon")
        self.view.addSubview(life3)
        life3.translatesAutoresizingMaskIntoConstraints = true
        life3.center = CGPoint(x: (view.bounds.width/7)+80, y: view.bounds.height/7)
        life3.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        //life 4
        life4.image = UIImage(named:"LifeIcon")
        self.view.addSubview(life4)
        life4.translatesAutoresizingMaskIntoConstraints = true
        life4.center = CGPoint(x: (view.bounds.width/7)+120, y: view.bounds.height/7)
        life4.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        //life 4
        life5.image = UIImage(named:"LifeIcon")
        self.view.addSubview(life5)
        life5.translatesAutoresizingMaskIntoConstraints = true
        life5.center = CGPoint(x: (view.bounds.width/7)+160, y: view.bounds.height/7)
        life5.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self.view)
        count = innerCount2 + innerCount + 1
        print(count)

        
        //teeth touch
        for i in 0...4 {
            let l = layers[random_sequence[i]]
            
            if l.path!.contains(point) {
                innerCount = innerCount + 1
                if (l.fillColor == UIColor.red.cgColor){
                    death = false
                }else{
                    l.fillColor = UIColor.red.cgColor
                    print ("bad")
                    death = true
                    deathCount = deathCount + 1
                }
            }
            
        }
        
        for i in 5...userNum-1 {
            let l = layers[random_sequence[i]]
            if l.path!.contains(point) {
                innerCount2 = innerCount2 + 1
                l.fillColor = UIColor.gray.cgColor
                
                if (l.fillColor == UIColor.gray.cgColor) {
                    //donothing
                }else{
                //print ("ok")
                }
                 death = false
            }
        }
        
        // died to change view
        
        if death == true {
            // help... stupid ways to do that
            
            if innerCount == 1 {
                life5.isHidden = true
            }
            if innerCount == 2 {
                life4.isHidden = true
            }
            if innerCount == 3 {
                life3.isHidden = true
            }
            if innerCount == 4 {
                life2.isHidden = true
            }
            if innerCount == 5 {
                life.isHidden = true
            }
            
            
            if count < 6 {
            //    life.text = items[count-1]
              //  deathCount = deathCount + 1
                
                if deathCount == 5 {
                    //then go to next view
                    /*-- MARK: helper functions --*/
                    //
                    func updateDeath() {
                          print ("died")
                        // function is delegated in ViewController
                        self.delegate?.updateDeath()
                        
                    }
                     updateDeath()
                }
            }
        }
        
          //not died to change view
             if count == userNum - 5{
            
                /*-- MARK: helper functions --*/
                //
                func updateSurvive() {
                    print("survived!!!")
                    // function is delegated in ViewController
                    self.delegate?.updateSurvive()
                    
                }
                 updateSurvive()
            }
        }
    }









//        alligatorImage.frame.origin = CGPoint(x: self.view.bounds.width - alligatorImage.frame.width, y: self.view.bounds.height - alligatorImage.frame.height)

