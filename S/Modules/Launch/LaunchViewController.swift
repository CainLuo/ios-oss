//
//  LaunchViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import OAServiceKit

class LaunchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppDelegate.setupPushNotification()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.login()
            }
        }
    }
}
