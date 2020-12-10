//
//  PersonalConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import Foundation
import UIKit
import OAComponentManagerKit

public class PersonalConnector: NSObject {
    public static func instance() -> PersonalConnector {
        let connector = PersonalConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension PersonalConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModulePersonal"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = PersonalViewController.configureWith()
        return vc
    }
}
