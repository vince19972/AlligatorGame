//
//  ViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/15.
//  Copyright © 2019 vinceshao. All rights reserved.
//


// main function: 1. buttons of teeth (svg)  2.  random the bad teeth
//3.trigger bad teeth - next view  4. click to lock the tooth.  5. life view
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var life: UITextField!
    var count = 0
    let items = ["❤️❤️❤️❤️","❤️❤️❤️","❤️❤️","❤️"," "]
  

   
    
// lazy var btn : teethView = teethView()
//
    override func viewDidLoad() {
        super.viewDidLoad()
        self.life.sizeToFit()
        life.text = "❤️❤️❤️❤️❤️"
        
        drawTeeth()
        self.view.layer.addSublayer(layer)
        self.view.layer.addSublayer(layer2)
        self.view.layer.addSublayer(layer3)
        
        
        print (randomNum)


    }
    
    var x1 = 256.17
    var x2 = 233.5
    var x3 = 282.5
    var x4 = 260.56
    var x5 = 256.17
    let randomNum = Int.random(in: 0 ..< 3)
    
     let layer = CAShapeLayer()
     let layer2 = CAShapeLayer()
     let layer3 = CAShapeLayer()
    
    func drawTeeth(){
        //// Color Declarations
        let color = UIColor(red: 0.009, green: 0.304, blue: 0.159, alpha: 0.985)

        //// teeth 1 Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: x1 , y: 226.5))
        bezierPath.addLine(to: CGPoint(x: x2, y: 298.5))
        bezierPath.addLine(to: CGPoint(x: x3, y: 298.5))
        bezierPath.addLine(to: CGPoint(x: x4, y: 226.5))
        bezierPath.addLine(to: CGPoint(x: x5 , y: 226.5))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        UIColor.gray.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        //lay1
       
        layer.path = bezierPath.cgPath
       // layer.fillColor = UIColor.black.cgColor
        layer.fillColor = color.cgColor
        layer.strokeColor = UIColor.clear.cgColor


        // teeth 2
        let bezierPath2 = UIBezierPath()
        bezierPath2.move(to: CGPoint(x: (x1+54) , y: 226.5))
        bezierPath2.addLine(to: CGPoint(x: (x2+54), y: 298.5))
        bezierPath2.addLine(to: CGPoint(x: (x3+54), y: 298.5))
        bezierPath2.addLine(to: CGPoint(x: (x4+54), y: 226.5))
        bezierPath2.addLine(to: CGPoint(x: (x5+54) , y: 226.5))
        bezierPath2.close()
        color.setFill()
        bezierPath2.fill()
        UIColor.gray.setStroke()
        bezierPath2.lineWidth = 1
        bezierPath2.stroke()
        //lay2
        layer2.path = bezierPath2.cgPath
       // layer2.fillColor = UIColor.black.cgColor
        layer2.fillColor = color.cgColor
        layer2.strokeColor = UIColor.clear.cgColor
        
        // teeth 3
        let bezierPath3 = UIBezierPath()
        bezierPath3.move(to: CGPoint(x: (x1+54+54) , y: 226.5))
        bezierPath3.addLine(to: CGPoint(x: (x2+54+54), y: 298.5))
        bezierPath3.addLine(to: CGPoint(x: (x3+54+54), y: 298.5))
        bezierPath3.addLine(to: CGPoint(x: (x4+54+54), y: 226.5))
        bezierPath3.addLine(to: CGPoint(x: (x5+54+54) , y: 226.5))
        bezierPath3.close()
        color.setFill()
        bezierPath3.fill()
        UIColor.gray.setStroke()
        bezierPath3.lineWidth = 1
        bezierPath3.stroke()
        //lay2
        layer3.path = bezierPath3.cgPath
        
        layer3.fillColor = color.cgColor
        layer3.strokeColor = UIColor.clear.cgColor

    }
    
    

    var death = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch!.location(in: self.view)
        let layers = [layer, layer2, layer3]
        
        
        
        //teeth touch
        
        for i in 0...2 {
            let l = layers[i]
            if i == randomNum {
                
                if l.path!.contains(point) {
                    print ("bad")
                    l.fillColor = UIColor.red.cgColor
                    death = true
                }
            } else {
                if l.path!.contains(point) {
                    l.fillColor = UIColor.black.cgColor
                    l.isHidden = true
                    print ("ok")
                    death = false
                }
            }
        }
        
        
        // died to change view
        
        if death == true {
            
            count = count + 1
            if count  < 6 {
            life.text = items[count-1]
    
            print ("died")
           
            }
        }
    }

    


}






