//
//  UIKit+Extensions.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

extension UINavigationBar {
    func hiddenShadow() {
        if #available(iOS 13, *) {
            let appearance = standardAppearance.copy()
            appearance.shadowImage = UIImage(named: "navigationBar_shadowImage")
            appearance.backgroundColor = .white
            standardAppearance = appearance
        } else {
            backgroundColor = .white
            shadowImage = UIImage(named: "navigationBar_shadowImage")
        }
        isTranslucent = false
    }
}

extension UITabBar {
    func hiddenShadow() {
        if #available(iOS 13, *) {
            let appearance = standardAppearance.copy()
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = UIImage()
            appearance.shadowColor = .clear
            appearance.backgroundColor = .white
            standardAppearance = appearance
        } else {
            shadowImage = UIImage()
            backgroundImage = UIImage()
            backgroundColor = .white
        }
        isTranslucent = false
    }
}
