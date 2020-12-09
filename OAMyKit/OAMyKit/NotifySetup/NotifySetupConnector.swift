//
//  NotifySetupConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import Foundation
import UIKit
import OAComponentManagerKit

public class NotifySetupConnector: NSObject {
    public static func instance() -> NotifySetupConnector {
        let connector = NotifySetupConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension NotifySetupConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleNotifySetup"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = NotifySetupViewController.configureWith()
        return vc
    }
}
