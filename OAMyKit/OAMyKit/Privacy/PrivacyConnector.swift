//
//  PrivacyConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import Foundation
import UIKit
import OAComponentManagerKit

public class PrivacyConnector: NSObject {
    public static func instance() -> PrivacyConnector {
        let connector = PrivacyConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension PrivacyConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModulePrivacy"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = PrivacyViewController.configureWith()
        return vc
    }
}
