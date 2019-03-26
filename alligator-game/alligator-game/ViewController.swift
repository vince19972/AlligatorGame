//
//  ViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/15.
//  Copyright © 2019 vinceshao. All rights reserved.
//


// main function: 1. buttons of teeth (svg)  2.  random the bad teeth
//3.trigger bad teeth - next view  4. click to lock the tooth.  5. life view

//need to do:
//6. add a function of - text view of user names  7.make a function of generate teeth.  8. UI saparete layers


import UIKit
var userNum:Int = 20 // the user number will depends on Vince's code, the string of users, and count the string.?

class ViewController: UIViewController{
    
    
    @IBOutlet weak var life: UITextField!
    var count = 0
    var deathCount = 0
    //life view test, will replace with Anna's UI file
    let items = ["❤️❤️❤️❤️","❤️❤️❤️","❤️❤️","❤️"," "]
   // var userNum:Int = 2
    let randomNum = Int(arc4random_uniform(UInt32(userNum)))
    var random_sequence = [] as [Int]
    //var shuffled_random_sequence = [] as [Int]
    
    
    
    
    var layers = [] as [CAShapeLayer]
    var teethOffset = 385/userNum*2
    var teethOffset2 = 385/11
    var x2 = 140.5
    //let x3 = x2 + teethOffset
    var x1 = 0.0
    var x3 = 0.0
    //upper teeth position set
    var xx1 = 168.5
    var xx2 = 168.5
    var xx3 = 205.5
    var yy1 = 183.5
    var yy2 = 236.5
    var yy3 = 195.5


   

    override func viewDidLoad() {
        super.viewDidLoad()
        userNum = userNum + 5
        random_sequence = Array(0...userNum-1)
        random_sequence.shuffle()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Playing")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        self.life.sizeToFit()
        life.text = "❤️❤️❤️❤️❤️"
        x3 = x2 + Double(teethOffset)
        x1 = x2 + Double(teethOffset)/2
        
       // xx3 = xx2 + Double(teethOffset2)
        //xx1 = xx2 + Double(teethOffset2)/2
        
        drawTeeth()
        
        //let randomNum = userNum.random()
       
        //challange: make the layer a string, and append the string?
        for i in 0...userNum-1{
            self.view.layer.addSublayer(layers[i])
        }
        
        print (randomNum)


    }
    
    
    
    
    func drawTeeth(){
        //// Color Declarations
        //let color = UIColor(red: 0.009, green: 0.304, blue: 0.159, alpha: 0.985)
        //chenge to white teeth color
        
        let color = UIColor.green
      //  let context = UIGraphicsGetCurrentContext()!
        
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

            
            bezierPath.move(to: CGPoint(x: temp_x1 , y: 328.5))
            bezierPath.addLine(to: CGPoint(x: temp_x2, y: 374.5))
            bezierPath.addLine(to: CGPoint(x: temp_x3, y: 374.5))
            
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
        
        //draw upper teeth
        
        
        for p:Int in 0...10{
            // teeth 1 Bezier Drawing
//            context.saveGState()
//            context.translateBy(x:209.62, y:179.5)
//            context.rotate(by: -164.1 * CGFloat.pi/180)
//
            let bezierPath2 = UIBezierPath()
            //            Double offset = Double(i)
            let temp_xx1 = xx1 + Double(p)*Double(teethOffset2)
            let temp_xx2 = xx2 + Double(p)*Double(teethOffset2)
            let temp_xx3 = xx3 + Double(p)*Double(teethOffset2)
            
            bezierPath2.move(to: CGPoint(x: temp_xx1 , y: 0.0))
            bezierPath2.addLine(to: CGPoint(x: temp_xx2, y: 46.0))
            bezierPath2.addLine(to: CGPoint(x: temp_xx3, y: 46.0))
            
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
            
           // context.restoreGState()
            
        }
  


    }
    
    

    var death = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self.view)
        //let layers = [layer, layer2, layer3]
        
        
        
        //teeth touch
        for i in 0...4 {
            let l = layers[random_sequence[i]]
                
            if l.path!.contains(point) {
                print ("bad")
                l.fillColor = UIColor.red.cgColor
                death = true
            }
            
        }
        for i in 5...userNum-1 {
            let l = layers[random_sequence[i]]
            if l.path!.contains(point) {
                l.fillColor = UIColor.black.cgColor
                //l.isHidden = true
                print ("ok")
                death = false
            }
        }
        
        
        
        
        // died to change view
        
        if death == true {
            
            count = count + 1
            if count  < 6 {
            life.text = items[count-1]
            deathCount = deathCount + 1
                
                if deathCount == 5 {
                    print ("died")
                    
                    //then go to next view
                    
                }
            }
            
            
        }
    }

    


}






