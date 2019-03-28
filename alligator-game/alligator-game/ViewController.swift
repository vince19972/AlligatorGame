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
// (2) Moving view with keyboard actions: https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
//
//
/*-------------------------------------*/

import UIKit

//
/*-- MARK: global variables --*/
//
let ServiceType = "alligator-game"
let MinimumPlayerNumber = 1
var ConnectedNumber = 0
let GAME_IS_STARTED = "GAME_STARTED"
let GAME_IS_OVER = "GAME_OVER"
let GAME_IS_VICTORY = "GAME_VICTORY"
var RandomSequence = [] as [Int]


class ViewController: UIViewController, UITextFieldDelegate, MultipeerServiceDelegate, EntryViewDelegate, StagingViewDelegate, GameViewDelegate {
    
    
    //
    /*-- MARK: child views properties --*/
    //
    // keep track of present view type
    enum childViewType: String {
        case entry = "EntryView"
        case staging = "StagingView"
        case game = "GameView"
        case survive = "SurviveView"
        case dead = "DeadView"
    }
    var presentView: childViewType = childViewType.entry
    
    // instantiate child views
    let entryViewController = EntryViewController()
    let stagingViewController = StagingViewController()
    let gameViewController = GameViewController()
    let surviveViewController = SurviveViewController()
    let deadViewController = DeadViewController()
    
    //
    /*-- MARK: class variables --*/
    //
    weak var nameInput: UITextField!
    var multipeerService: MultipeerService?
    let TAP_TOOTH = "tapTooth"
    

    //
    /*-- MARK: viewDidLoad --*/
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // child view settings
        entryViewController.delegate = self
        stagingViewController.delegate = self
        gameViewController.delegate = self
        updatePresentChildViewTarget(childViewType.entry)
        
        /* REFERENCE CREDIT - (2) */
        // keyboard events listening
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    //
    /*-- MARK: keyboard events --*/
    //
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
                entryViewController.highlightNameField(keyboardHeight: keyboardSize.height)
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            entryViewController.highlightNameField(toHighlight: false)
        }
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
            self.startMultipeerService(displayName: nameInput.text!)
            
            // update actions
            updatePresentChildViewTarget(childViewType.staging)
            self.stagingViewController.updateConnectedNumber(1)
        }
    }
    // StagingViewDelegate protocols
    func startButtonTapped() {
        // When the start button is tapped in stagingView,
        // updatePresentChildViewTarget called here only update triggered device's child view.
        // Note that it has to be called in P2P receivedMsg function,
        // in order to trigger connected devices' child view as well.
        updatePresentChildViewTarget(childViewType.game)
        self.multipeerService?.send(msg: GAME_IS_STARTED)
        generateRandomTeeth()
    }
    
    // GameViewDelegate protocols
    func updateDeath() {
        updatePresentChildViewTarget(childViewType.dead)
        self.multipeerService?.send(msg: GAME_IS_OVER)
    }
    func updateSurvive() {
        updatePresentChildViewTarget(childViewType.survive)
        self.multipeerService?.send(msg: GAME_IS_VICTORY)
    }
    func toothTapped(toothNumber: Int, isBadTooth: Bool) {
        self.multipeerService?.send(msg: "\(TAP_TOOTH):\(String(toothNumber)):\(String(isBadTooth))")
    }
    
    
    //
    /*-- MARK: multiPeer functions --*/
    //
    func startMultipeerService(displayName: String) {
        self.multipeerService = nil
        self.multipeerService = MultipeerService(dispayName: displayName)
        self.multipeerService?.delegate = self
    }
    // MultipeerServiceDelegate protocols
    func connectedDevicesChanged(manager: MultipeerService, connectedDevices: [String]) {
        DispatchQueue.main.async {
            self.stagingViewController.updateConnectedNumber(manager.session.connectedPeers.count)
            generateRandomTeeth()
        }
    }
    func receivedMsg(manager: MultipeerService, msg: String) {
        DispatchQueue.main.async {
            // update connected devices' child view
            if msg == GAME_IS_STARTED {
                self.updatePresentChildViewTarget(childViewType.game)
            } else if msg == GAME_IS_VICTORY {
                self.updatePresentChildViewTarget(childViewType.survive)
            } else if msg == GAME_IS_OVER {
                self.updatePresentChildViewTarget(childViewType.dead)
            }
            
            if msg.contains(self.TAP_TOOTH) {
                let msgArr = msg.components(separatedBy: ":")
                
                self.gameViewController.updateToothState(toothNumber: Int(msgArr[1])!, isBadTooth: Bool(msgArr[2])!)
            }
        }
    }
    
    
    //
    /*-- MARK: VireController helper functions --*/
    //
    func updatePresentChildViewTarget(_ viewType: childViewType) {
        self.presentView = viewType
        
        switch viewType {
            case childViewType.entry:
                surviveViewController.remove()
                deadViewController.remove()
                
                add(entryViewController)
            case childViewType.staging:
                entryViewController.remove()
                
                add(stagingViewController)
            case childViewType.game:
                stagingViewController.remove()
            
                add(gameViewController)
            case childViewType.dead:
                gameViewController.remove()
                
                add(deadViewController)
            case childViewType.survive:
                gameViewController.remove()
                
                add(surviveViewController)
        }
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



//
/*-- MARK: generate random teeth number --*/
//
func generateRandomTeeth() {
    RandomSequence = Array(0...(ConnectedNumber + 5) - 1)
    RandomSequence.shuffle()
}
