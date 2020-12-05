//
//  CommentsConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class CommentsConnector: NSObject {
    public static func instance() -> CommentsConnector {
        let connector = CommentsConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension CommentsConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleComments"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = CommentsViewController.configureWith()
        return vc
    }
}
