//
//  AppDelegate.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import SwifterSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIViewController.doBadSwizzleStuff()
        UIView.doBadSwizzleStuff()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Storyboard.Launch.instantiate(LaunchViewController.self)
        window?.makeKeyAndVisible()

        return true
    }
}

extension AppDelegate {
    func login() {
        window?.switchRootViewController(to: TabBarViewController.configureWith(), options: .transitionCrossDissolve)
    }
    
    func logout() {
        window?.switchRootViewController(to: Storyboard.Login.instantiateRoot(), options: .transitionCrossDissolve)
    }
}
