//
//  QRCodeConnector.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import Foundation
import UIKit
import OAComponentManagerKit

public class QRCodeConnector: NSObject {
    public static func instance() -> QRCodeConnector {
        let connector = QRCodeConnector()
        return connector
    }
    
    public func register() {
        ComponentManager.register(self)
    }
}

extension QRCodeConnector: ComponentManagerPrt {
    public func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleQRCode"
    }
    
    public func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        guard canOpenURL(url) else { return nil }
        
        let vc = QRCodeViewController.configureWith()
        return vc
    }
}
