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
    
    func toothTapped(toothNumber: Int, isBadTooth: Bool)
    func updateDeath()
    func updateSurvive()
    
}


class GameViewController: UIViewController {
    
    var count = 0
    var deathCount = 0
    var notdiedCount = 0
    var death = false
    //life view test, will replace with Anna's UI file
    

    // delegate
    weak var delegate: GameViewDelegate?
    
 


    //let items = ["❤️❤️❤️❤️","❤️❤️❤️","❤️❤️","❤️"," "]
    
    var layers = [] as [CAShapeLayer]
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
        
        
        let life = UIImageView(frame:CGRect(x:10, y:50, width:500, height:300))
        life.image = UIImage(named:"LifeIcon")
        self.view.addSubview(life)
        life.translatesAutoresizingMaskIntoConstraints = true
        life.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        life.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
    
      

        
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


        //  self.life.sizeToFit()
        //  life.text = "❤️❤️❤️❤️❤️"
        x3 = x2 + Double(teethOffset)
        x1 = x2 + Double(teethOffset)/2
        
        // xx3 = xx2 + Double(teethOffset2)
        //xx1 = xx2 + Double(teethOffset2)/2
        
        //math the teeth position

        
        
        drawTeeth()

        
        //challange: make the layer a string, and append the string?
        for i in 0...userNum-1{
            self.view.layer.addSublayer(layers[i])
        }
        
//        print (randomNum)
        print(mathForTeethPosition1)
        print(mathForTeethPosition2)
        print(xx1,yy1)
        
        print(alligatorImageViewHeight,alligatorImageViewWidth)
        print(screenHeight,screenWidth)

        
        
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
    
    func updateToothState(toothNumber: Int, isBadTooth: Bool) {
        print("🔥")
        print(toothNumber)
        if isBadTooth {
            layers[RandomSequence[toothNumber]].fillColor = UIColor.red.cgColor
            death = true
        } else {
            layers[RandomSequence[toothNumber]].fillColor = UIColor.black.cgColor
            death = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self.view)

        
        //teeth touch
        for i in 0...4 {
            let l = layers[RandomSequence[i]]
            
            if l.path!.contains(point) {
                
                if (l.fillColor == UIColor.red.cgColor){
                    death = false
                }else{
                    l.fillColor = UIColor.red.cgColor
                    print ("bad")
                    death = true
                    self.delegate?.toothTapped(toothNumber: i, isBadTooth: true)
                }
            }
            
        }
        
        for i in 5...userNum-1 {
            let l = layers[RandomSequence[i]]
            if l.path!.contains(point) {
                l.fillColor = UIColor.black.cgColor
                
                if (l.fillColor == UIColor.black.cgColor) {
                    //donothing
                }else{
                //print ("ok")
                }
                death = false
                self.delegate?.toothTapped(toothNumber: i, isBadTooth: false)
            }
        }
        
        // died to change view
        
        if death == true {
            
            count = count + 1
            if count  < 6 {
            //    life.text = items[count-1]
                deathCount = deathCount + 1
                
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
        if death == false{
            notdiedCount = notdiedCount + 1
            if notdiedCount == userNum - 5{
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

}






