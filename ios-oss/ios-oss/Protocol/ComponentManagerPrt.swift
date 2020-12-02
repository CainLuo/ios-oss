//
//  ComponentManagerPrt.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

protocol ComponentManagerPrt: class {
    func connectToOpenURL(_ url: URL, parameters: Dictionary<String, Any>) -> UIViewController?
    func connectToHandle(_ prt: Protocol) -> Any?
}