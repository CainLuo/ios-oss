//
//  LaunchConnector.swift
//  OALaunchKit
//
//  Created by CainLuo on 2020/12/8.
//

import UIKit
import OAComponentManagerKit

public class LaunchConnector: NSObject {
    public static func instance() -> LaunchConnector {
        let connector = LaunchConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension LaunchConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleLaunch"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = LaunchViewController.configureWith()
        return vc
    }
}
