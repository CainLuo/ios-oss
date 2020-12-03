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

extension UIView {
    @IBInspectable public var layoutImage: UIImage {
        set {
            layer.contents = newValue.cgImage
        }
        get {
            return layer.contents as! UIImage
        }
    }
}

extension UIApplication {
    public class func openSetting() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: nil)
        }
    }
    
    public static func callPhoneNumber(phoneNumber: String) {
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            shared.open(url)
        }
    }
}
