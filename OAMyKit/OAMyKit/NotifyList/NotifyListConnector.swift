//
//  NotifyListConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class NotifyListConnector: NSObject {
    public static func instance() -> NotifyListConnector {
        let connector = NotifyListConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension NotifyListConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleNotifyList"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = NotifyListViewController.configureWith()
        return vc
    }
}
