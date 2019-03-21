//
//  MultipeerService.swift
//  alligator-game
//
//  Created by 邵名浦 on 2019/3/20.
//  Copyright © 2019 vinceshao. All rights reserved.
//
//  This code is originally created by MobileLab 2019 at ITP, NYU
//  >> https://github.com/mobilelabclass/mobile-lab-p2p-kit <<
//

import Foundation
import MultipeerConnectivity

protocol MultipeerServiceDelegate {
    
    func connectedDevicesChanged(manager : MultipeerService, connectedDevices: [String])
    func receivedMsg(manager : MultipeerService, msg: String)
    
}

class MultipeerService : NSObject {
    
    private let serviceAdvertiser : MCNearbyServiceAdvertiser
    private let serviceBrowser : MCNearbyServiceBrowser
    
    var delegate : MultipeerServiceDelegate?
    
    var session: MCSession!
    
    init(dispayName: String) {
        let myPeerId = MCPeerID(displayName: dispayName)
        
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: ServiceType)
        self.serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: ServiceType)
        
        super.init()
        
        // encryption???????????
        session = MCSession(peer: myPeerId, securityIdentity: nil, encryptionPreference: .none)
        session.delegate = self
        
        self.serviceAdvertiser.delegate = self
        self.serviceAdvertiser.startAdvertisingPeer()
        
        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        self.serviceAdvertiser.stopAdvertisingPeer()
        self.serviceBrowser.stopBrowsingForPeers()
    }
    
    // NOTE: Method to serialize msg and send to peers.
    func send(msg : String) {
        print("sendMsg: \(msg) to \(session.connectedPeers.count) peers")
        
        if session.connectedPeers.count > 0 {
            do {
                try self.session.send(msg.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            }
            catch let error {
                print("Error for sending: \(error)")
            }
        }
    }
}

extension MultipeerService : MCNearbyServiceAdvertiserDelegate {
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                    didNotStartAdvertisingPeer error: Error) {
        
        print("didNotStartAdvertisingPeer: \(error)")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser,
                    didReceiveInvitationFromPeer peerID: MCPeerID,
                    withContext context: Data?,
                    invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        
        print("didReceiveInvitationFromPeer \(peerID)")
        
        invitationHandler(true, self.session)
    }
    
}

extension MultipeerService : MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser,
                 didNotStartBrowsingForPeers error: Error) {
        
        print("didNotStartBrowsingForPeers: \(error)")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser,
                 foundPeer peerID: MCPeerID,
                 withDiscoveryInfo info: [String : String]?) {
        
        print("foundPeer: \(peerID)")
        print("invitePeer: \(peerID)")
        
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 10)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser,
                 lostPeer peerID: MCPeerID) {
        
        print("lostPeer: \(peerID)")
    }
}

extension MultipeerService : MCSessionDelegate {
    
    func session(_ session: MCSession,
                 peer peerID: MCPeerID,
                 didChange state: MCSessionState) {
        
        print("peer \(peerID) didChangeState: \(state.rawValue)")
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices: session.connectedPeers.map{$0.displayName})
    }
    
    func session(_ session: MCSession,
                 didReceive data: Data,
                 fromPeer peerID: MCPeerID) {
        
        print("didReceiveData: \(data)")
        let str = String(data: data, encoding: .utf8)!
        self.delegate?.receivedMsg(manager: self, msg: str)
    }
    
    func session(_ session: MCSession,
                 didReceive stream: InputStream,
                 withName streamName: String,
                 fromPeer peerID: MCPeerID) {
        
        print("didReceiveStream")
    }
    
    func session(_ session: MCSession,
                 didStartReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID, with progress: Progress) {
        
        print("didStartReceivingResourceWithName")
    }
    
    func session(_ session: MCSession,
                 didFinishReceivingResourceWithName resourceName: String,
                 fromPeer peerID: MCPeerID,
                 at localURL: URL?,
                 withError error: Error?) {
        
        print("didFinishReceivingResourceWithName")
    }
}
