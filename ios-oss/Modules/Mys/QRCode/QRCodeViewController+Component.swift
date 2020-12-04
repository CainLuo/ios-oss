//
//  QRCodeViewController+Component.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import OAComponentManagerKit

extension QRCodeViewController: ComponentManagerPrt {
    func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModuleQRCode"
    }

    func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        let vc = QRCodeViewController.configureWith()
        return vc
    }
}
