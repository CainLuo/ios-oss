//
//  NicheViewController+Component.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

extension NicheViewController: ComponentManagerPrt {
    func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>) -> UIViewController? {
        let vc = NicheViewController.configureWith()
        return vc
    }
    
    func connectToHandle(_ prt: Protocol) -> Any? {
        return nil
    }
}
