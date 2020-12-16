//
//  TabBarViewController+Component.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/12/9.
//

import UIKit
import OAComponentManagerKit

extension TabBarViewController: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleTabBar"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        let vc = TabBarViewController.configureWith()
        return vc
    }
}
