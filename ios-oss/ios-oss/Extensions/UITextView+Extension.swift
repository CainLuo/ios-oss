//
//  UITextView+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

// MARK: UITextView
extension UITextView {
    @IBInspectable var fitFont: CGFloat {
        set {
            font = UIFont.fitFont(newValue)
        }
        get {
            if let pointSize = font?.pointSize {
                return pointSize
            }
            return 17
        }
    }
    
    @IBInspectable var fitBoldFont: CGFloat {
        set {
            font = UIFont.fitBoldFont(newValue)
        }
        get {
            if let pointSize = font?.pointSize {
                return pointSize
            }
            return 17
        }
    }
}

