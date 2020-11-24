//
//  UIFont+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

extension UIFont {
    static func fitFont(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: UIScreen.fitScreen(size))
    }
    
    static func fitPlusFont(_ size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: UIScreen.fitPlusScreen(size))
    }
    
    static func fitBoldFont(_ size: CGFloat) -> UIFont {
        UIFont.boldSystemFont(ofSize: UIScreen.fitScreen(size))
    }
    
    static func fitPlusBoldFont(_ size: CGFloat) -> UIFont {
        UIFont.boldSystemFont(ofSize: UIScreen.fitPlusScreen(size))
    }
}
