//
//  UIScreen+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

extension UIScreen {
    public var width: CGFloat {
        return size.width
    }
    
    public var height: CGFloat {
        return size.height
    }
    
    public var size: CGSize {
        return self.bounds.size
    }
    
    public static func fitScreen(_ value: CGFloat) -> CGFloat {
        let width = Float(UIScreen.main.bounds.size.width)
        let newValue: Float = Float((value / 2.0))
        if UIDevice.current.model == "iPad" {
            return CGFloat(ceilf(width / 834.0 * newValue))
        } else {
            return CGFloat(ceilf(width / 375.0  * newValue))
        }
    }

    public static func fitPlusScreen(_ value: CGFloat) -> CGFloat {
        let width = Float(UIScreen.main.bounds.size.width)
        let newValue: Float = Float((value / 2.0))
        if UIDevice.current.model == "iPad" {
            return CGFloat(ceilf(width / 834.0 * newValue))
        } else {
            return CGFloat(ceilf(width / 540.0  * newValue))
        }
    }
}
