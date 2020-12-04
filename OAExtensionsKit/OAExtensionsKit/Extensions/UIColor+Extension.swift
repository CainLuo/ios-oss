//
//  UIColor+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

extension UIColor {
    
    /// Hex sRGB color initializer.
    /// - Parameter hex: Pass in a sRGB color integer using hex notation, i.e. 0xFFFFFF. Make sure to only include 6 hex digits.
    public convenience init(_ hex: Int) {
        assert(
            0...0xFFFFFF ~= hex,
            "UIColor+Hex: Hex value given to UIColor initializer should only include RGB values, i.e. the hex value should have six digits." //swiftlint:disable:this line_length
        )
        let red = (hex & 0xFF0000) >> 16
        let green = (hex & 0x00FF00) >> 8
        let blue = (hex & 0x0000FF)
        self.init(red: red, green: green, blue: blue)
    }

    /// RGB integer color initializer.
    /// - Parameters:
    ///   - red: Red component as integer. In iOS 9 or below, this value should be between 0 and 255. iOS 10
    ///                    and above uses an extended color space to support wide color.
    ///   - green: Green component as integer. In iOS 9 or below, this value should be between 0 and 255. iOS 10
    ///                    and above uses an extended color space to support wide color.
    ///   - blue: Blue component as integer. In iOS 9 or below, this value should be between 0 and 255. iOS 10
    ///                    and above uses an extended color space to support wide color.
    ///   - alpha: Color alpha, Default 1.0
    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha:  alpha
        )
    }
}
