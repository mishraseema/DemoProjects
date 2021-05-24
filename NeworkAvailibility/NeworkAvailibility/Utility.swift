//
//  Utility.swift
//  NeworkAvailibility
//
//  Created by Seema Pandey on 24/05/21.
//

import Foundation
import Reachability

class Network {
    
    static let reachbility = try! Reachability()
    
    static var isReachable:Bool {
        return reachbility.connection != Reachability.Connection.unavailable
    }
}


@objc protocol NetworkReachable {
    @objc func networkChanged()
}

extension NetworkReachable {
    func configureNetworkReachability() {
        Network.reachbility.whenReachable = { _ in
            NotificationCenter.default.post(name: .reachabilityChanged, object: nil, userInfo: nil)
        }
        
        Network.reachbility.whenUnreachable = { _ in
            NotificationCenter.default.post(name: .reachabilityChanged, object: nil, userInfo: nil)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(networkChanged), name: .reachabilityChanged, object: nil)
    }
}
