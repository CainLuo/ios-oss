//
//  UIScreen+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

public extension UIScreen {
    var width: CGFloat {
        return size.width
    }
    
    var height: CGFloat {
        return size.height
    }
    
    var size: CGSize {
        return self.bounds.size
    }
    
    static func fitScreen(_ value: CGFloat) -> CGFloat {
        let width = Float(UIScreen.main.bounds.size.width)
        let newValue: Float = Float((value))
        if UIDevice.current.model == "iPad" {
            return CGFloat(ceilf(width / 834.0 * newValue))
        } else {
            return CGFloat(ceilf(width / 375.0  * newValue))
        }
    }

    static func fitPlusScreen(_ value: CGFloat) -> CGFloat {
        let width = Float(UIScreen.main.bounds.size.width)
        let newValue: Float = Float((value))
        if UIDevice.current.model == "iPad" {
            return CGFloat(ceilf(width / 834.0 * newValue))
        } else {
            return CGFloat(ceilf(width / 540.0  * newValue))
        }
    }
}
