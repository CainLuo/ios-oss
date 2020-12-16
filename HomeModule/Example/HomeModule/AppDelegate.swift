//
//  AppDelegate.swift
//  HomeModule
//
//  Created by 350116542@qq.com on 12/16/2020.
//  Copyright (c) 2020 350116542@qq.com. All rights reserved.
//

import UIKit
import HomeModule

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navi = UINavigationController(rootViewController: HomeController())
        
        let tab = UITabBarController()
        tab.viewControllers = [navi]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
        
        return true
    }
}

