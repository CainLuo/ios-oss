//
//  FollowsConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class FollowsConnector: NSObject {
    public static func instance() -> FollowsConnector {
        let connector = FollowsConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension FollowsConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleFollows"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = FollowsViewController.configureWith()
        return vc
    }
}
