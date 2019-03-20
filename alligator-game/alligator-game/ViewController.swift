//
//  ViewController.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/15.
//  Copyright © 2019 vinceshao. All rights reserved.
//

/*--------- REFERENCE CREDITS ---------*/
//
//
// (1) Using child view controllers: https://www.swiftbysundell.com/posts/using-child-view-controllers-as-plugins-in-swift
//
//
/*-------------------------------------*/

import UIKit

//
/*-- MARK: global variables --*/
//
let ServiceType = "alligator-game"

// ViewController
class ViewController: UIViewController, UITextFieldDelegate, MultipeerServiceDelegate, EntryViewDelegate {
    
    //
    /*-- MARK: class variables --*/
    //
    weak var nameInput: UITextField!
    var multipeerService: MultipeerService?
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        /*-- MARK: childViews appending --*/
        //
        // entry view
        let entryViewController = EntryViewController()
        add(entryViewController)
        entryViewController.delegate = self
    }
    
    //
    /*-- MARK: childViews functions --*/
    //
    // EntryViewDelegate protocols
    func submitButtonTapped(nameInput: UITextField) {

        // Check text field is not empty, otherwise start P2P connection
        if (nameInput.text?.isEmpty)! {
            AlertMessage().present(viewController: self, message: "Enter Valid Player Id")
        } else {
            // MARK: start P2P connection
            self.startMultipeerService(displayName: self.nameInput.text!)
        }
    }
    
    
    //
    /*-- MARK: multiPeer functions --*/
    //
    
    // start multipeer service with display name.
    func startMultipeerService(displayName: String) {
        self.multipeerService = nil
        self.multipeerService = MultipeerService(dispayName: displayName)
        self.multipeerService?.delegate = self
    }
    
    // MultipeerServiceDelegate protocols
    func connectedDevicesChanged(manager: MultipeerService, connectedDevices: [String]) {
        print("test")
    }
    func receivedMsg(manager: MultipeerService, msg: String) {
        print("test")
    }

}


//
/*-- MARK: childView add and remove functions --*/
//
extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
