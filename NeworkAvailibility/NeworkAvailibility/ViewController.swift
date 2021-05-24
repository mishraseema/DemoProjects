//
//  ViewController.swift
//  NeworkAvailibility
//
//  Created by Seema Pandey on 24/05/21.
//

import UIKit

class ViewController: UIViewController, NetworkReachable {
    
    @IBOutlet private weak var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNetworkReachability()
    }
    
    func networkChanged() {
        label.text = Network.isReachable ? "Online" : "Offline"
        label.textColor = Network.isReachable ? .green : .red
    }

}

