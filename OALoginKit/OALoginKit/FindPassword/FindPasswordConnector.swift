//
//  FindPasswordConnector.swift
//  OALoginKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class FindPasswordConnector: NSObject {
    public static func instance() -> FindPasswordConnector {
    let connector = FindPasswordConnector()
    return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension FindPasswordConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleRegister"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = FindPasswordViewController.configureWith()
        return vc
    }
}
