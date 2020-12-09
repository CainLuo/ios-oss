//
//  FeedbackConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import OAComponentManagerKit

public class FeedbackConnector: NSObject {
    public static func instance() -> FeedbackConnector {
        let connector = FeedbackConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension FeedbackConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleFeedback"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = FeedbackViewController.configureWith()
        return vc
    }
}
