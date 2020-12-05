//
//  CollectionsConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class CollectionsConnector: NSObject {
    public static func instance() -> CollectionsConnector {
        let connector = CollectionsConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension CollectionsConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleCollections"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = CollectionsViewController.configureWith()
        return vc
    }
}
