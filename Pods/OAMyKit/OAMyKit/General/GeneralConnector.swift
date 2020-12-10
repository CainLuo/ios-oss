//
//  GeneralConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class GeneralConnector: NSObject {
    public static func instance() -> GeneralConnector {
        let connector = GeneralConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension GeneralConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleGeneral"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = GeneralController.configureWith()
        return vc
    }
}
