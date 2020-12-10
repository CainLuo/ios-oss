//
//  LoginStoryboard.swift
//  OALoginKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit

private let bundle = Bundle(identifier: "com.yunyu.OALoginKit")

enum LoginStoryboard: String {
    case Login
    case Forget
    case FindPassword
        
    func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: bundle)
            .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC else {
            fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)")
        }
        
        return vc
    }
    
    func instantiateRoot() -> UIViewController {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: bundle)
            .instantiateInitialViewController() else {
            fatalError("Couldn't instantiate root from \(self.rawValue)")
        }
        
        return vc
    }
    
    static func instantiateName<VC: UIViewController>(name: String, identifier: String) -> VC {
        guard let vc = UIStoryboard(name: name, bundle: bundle)
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
