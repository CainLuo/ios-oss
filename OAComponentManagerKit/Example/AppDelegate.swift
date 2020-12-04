//
//  AppDelegate.swift
//  Example
//
//  Created by YYKJ0048 on 2020/12/4.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ModuleAConnector.instance().register()
        return true
    }
}

