//
//  ForgetConnector.swift
//  OALoginKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class ForgetConnector: NSObject {
    public static func instance() -> ForgetConnector {
    let connector = ForgetConnector()
    return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension ForgetConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleForget"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = ForgetViewController.configureWith()
        return vc
    }
}
