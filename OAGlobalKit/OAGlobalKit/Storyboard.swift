//
//  Storyboard.swift
//  OAGlobalKit
//
//  Created by YYKJ0048 on 2020/12/4.
//

import UIKit

public class Storyboard {
    public static func instantiate<VC: UIViewController>(_ name: String, _ viewController: VC.Type, bundle: Bundle? = nil) -> VC {
        guard let vc = UIStoryboard(name: name, bundle: bundle ?? .main)
            .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC else {
            fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(name)")
        }
        return vc
    }
    
    public static func instantiateRoot(_ name: String, bundle: Bundle? = nil) -> UIViewController {
        guard let vc = UIStoryboard(name: name, bundle: bundle ?? .main)
            .instantiateInitialViewController() else {
            fatalError("Couldn't instantiate root from \(name)")
        }
        
        return vc
    }
    
    public static func instantiateName<VC: UIViewController>(_ name: String, _ identifier: String, bundle: Bundle? = nil) -> VC {
        guard let vc = UIStoryboard(name: name, bundle: bundle ?? .main)
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
