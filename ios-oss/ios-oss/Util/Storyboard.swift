//
//  Storyboard.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Foundation
import UIKit

enum Storyboard: String {
    case Launch
    case TabBar
    case Login
    
    case About
    case Collections
    case Follows
    case Comments
    case Feedback
    case General
    case My
    case Niche
    case NotifyList
    case NotifySetup
    case Personal
    case Privacy
    case QRCode
    
    func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: Bundle.main)
            .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC else {
            fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)")
        }
        
        return vc
    }
    
    func instantiateRoot() -> UIViewController {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: Bundle.main)
            .instantiateInitialViewController() else {
            fatalError("Couldn't instantiate root from \(self.rawValue)")
        }
        
        return vc
    }
    
    static func instantiateName<VC: UIViewController>(name: String, identifier: String) -> VC {
        guard let vc = UIStoryboard(name: name, bundle: Bundle.main)
            .instantiateViewController(withIdentifier: identifier) as? VC else {
            fatalError("Couldn't instantiate \(identifier) from \(name)")
        }
        return vc
    }
}

extension UIViewController {
    static var defultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}
