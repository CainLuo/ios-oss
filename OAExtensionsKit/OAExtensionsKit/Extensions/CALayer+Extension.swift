//
//  CALayer+Extensions.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

extension CALayer {
    public static func lineLayer(_ color: UIColor? = UIColor(0xf5f5f5)) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = color?.cgColor
        return layer
    }
}
