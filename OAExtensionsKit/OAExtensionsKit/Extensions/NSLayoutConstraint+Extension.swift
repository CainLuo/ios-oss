//
//  NSLayoutConstraint+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

private var NSLayoutConstraintKey = "NSLayoutConstraintKey"

public extension NSLayoutConstraint {

    @IBInspectable var fitConstant: CGFloat {
        set {
            constant = UIScreen.fitScreen(newValue)
            objc_setAssociatedObject(self, &NSLayoutConstraintKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let vc = objc_getAssociatedObject(self, &NSLayoutConstraintKey) as? CGFloat {
                return vc
            }
            return constant
        }
    }
}
