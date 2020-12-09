//
//  LoginConnector.swift
//  OALoginKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class LoginConnector: NSObject {
    public static func instance() -> LoginConnector {
    let connector = LoginConnector()
    return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension LoginConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleLogin"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = LoginViewController.configureWith()
        return vc
    }
}
