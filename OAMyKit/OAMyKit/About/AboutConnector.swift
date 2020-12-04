//
//  AboutConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/4.
//

import UIKit
import OAComponentManagerKit

public class AboutConnector: NSObject {
    public static func instance() -> MyConnector {
        let connector = MyConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension AboutConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleAbout"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = AboutViewController.configureWith()
        return vc
    }
}
