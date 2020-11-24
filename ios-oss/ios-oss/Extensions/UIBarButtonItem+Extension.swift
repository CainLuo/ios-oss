//
//  UIBarButtonItem+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

// MARK: UIBarButtonItem
extension UIBarButtonItem {
    @IBInspectable public var localizedTag: String {
        set {
            title = newValue.localized()
        }
        get {
            return self.localizedTag.localized()
        }
    }
}
