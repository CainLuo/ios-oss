//
//  RegisterConnector.swift
//  OALoginKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class RegisterConnector: NSObject {
    public static func instance() -> RegisterConnector {
    let connector = RegisterConnector()
    return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension RegisterConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleRegister"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = RegisterViewController.configureWith()
        return vc
    }
}
