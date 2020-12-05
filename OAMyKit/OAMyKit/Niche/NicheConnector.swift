//
//  NicheConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class NicheConnector: NSObject {
    public static func instance() -> NicheConnector {
        let connector = NicheConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension NicheConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleNiche"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = NicheViewController.configureWith()
        return vc
    }
}
