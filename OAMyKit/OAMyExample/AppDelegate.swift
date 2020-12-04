//
//  AppDelegate.swift
//  OAMyExample
//
//  Created by YYKJ0048 on 2020/12/4.
//

import UIKit
import OAExtensionsKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        UIView.doBadSwizzleStuff()
        UIViewController.doBadSwizzleStuff()
        
        return true
    }


}

