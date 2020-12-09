//
//  UIButton+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import Localize_Swift

// MARK: UIButton
public extension UIButton {
    @IBInspectable var localizedTag: String {
        set {
            setTitle(newValue.localized(), for: .normal)
            setTitle(newValue.localized(), for: .selected)
            setTitle(newValue.localized(), for: .disabled)
        }
        get {
            return self.localizedTag.localized()
        }
    }
    
    @IBInspectable var fitFont: CGFloat {
        set {
            titleLabel?.font = UIFont.fitFont(newValue)
        }
        get {
            if let pointSize = titleLabel?.font?.pointSize {
                return pointSize
            }
            return 17
        }
    }
    
    @IBInspectable var fitBoldFont: CGFloat {
        set {
            titleLabel?.font = UIFont.fitBoldFont(newValue)
        }
        get {
            if let pointSize = titleLabel?.font?.pointSize {
                return pointSize
            }
            return 17
        }
    }
}
