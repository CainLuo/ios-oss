//
//  MyConnector.swift
//  OAMyExample
//
//  Created by YYKJ0048 on 2020/12/4.
//

import UIKit
import OAComponentManagerKit

public class MyConnector: NSObject {
    public static func instance() -> MyConnector {
        let connector = MyConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension MyConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleMy"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = MyViewController.configureWith()
        return vc
    }
}
