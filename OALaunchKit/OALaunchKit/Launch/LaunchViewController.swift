//
//  LaunchViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import OAServiceKit
import OANavigatorKit
import SwifterSwift
import OAComponentManagerKit

class LaunchViewController: BaseViewController {

    public static func configureWith() -> LaunchViewController {
        return LaunchStoryboard.Launch.instantiate(LaunchViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.switchWindowRootViewController()
        }
    }
}

extension LaunchViewController {
    private func switchWindowRootViewController() {
        if let vc = ComponentManager.viewControllerForURL(LaunchConstants.ModuleURL.tabBar),
           let window = UIApplication.shared.keyWindow {
            window.switchRootViewController(to: vc)
        }
    }
}
