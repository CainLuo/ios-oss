//
//  PersonalViewController+Component.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import OAComponentManagerKit

extension PersonalViewController: ComponentManagerPrt {
    func canOpenURL(_ url: URL) -> Bool {
        return url.host == "ModulePersonal"
    }

    func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>?, completion: (([String : Any]) -> Void)?) -> UIViewController? {
        let vc = PersonalViewController.configureWith()
        return vc
    }
}
