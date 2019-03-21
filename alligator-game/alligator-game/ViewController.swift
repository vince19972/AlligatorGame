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
let MinimumPlayerNumber = 1
let GAME_IS_STARTED = "GAME_STARTED"


class ViewController: UIViewController, UITextFieldDelegate, MultipeerServiceDelegate, EntryViewDelegate, StagingViewDelegate {
    
    
    //
    /*-- MARK: child views properties --*/
    //
    // keep track of present view type
    enum childViewType: String {
        case entry = "entryView"
        case staging = "stagingView"
        case game = "gameView"
    }
    var presentView: String = childViewType.entry.rawValue
    
    // instantiate child views
    let entryViewController = EntryViewController()
    let stagingViewController = StagingViewController()
    let gameViewController = GameViewController()
    
    
    //
    /*-- MARK: class variables --*/
    //
    weak var nameInput: UITextField!
    var multipeerService: MultipeerService?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // child view settings
        entryViewController.delegate = self
        stagingViewController.delegate = self
        
        updatePresentChildViewTarget(childViewType.entry)
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
        }
    }
    func receivedMsg(manager: MultipeerService, msg: String) {
        DispatchQueue.main.async {
            // update connected devices' child view
            if msg == GAME_IS_STARTED {
                self.updatePresentChildViewTarget(childViewType.game)
            }
        }
    }
    
    
    //
    /*-- MARK: VireController helper functions --*/
    //
    func updatePresentChildViewTarget(_ viewType: childViewType) {
        self.presentView = viewType.rawValue
        
        switch self.presentView {
            case childViewType.entry.rawValue:
                stagingViewController.remove()
                gameViewController.remove()
                
                add(entryViewController)
            case childViewType.staging.rawValue:
                entryViewController.remove()
                gameViewController.remove()
                
                add(stagingViewController)
            case childViewType.game.rawValue:
                entryViewController.remove()
                stagingViewController.remove()
                
                add(gameViewController)
            default:
                stagingViewController.remove()
                gameViewController.remove()
                
                add(entryViewController)
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
