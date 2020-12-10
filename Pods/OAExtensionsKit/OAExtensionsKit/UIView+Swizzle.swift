//
//  UIView+Swizzle.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

private func swizzle(_ v: UIView.Type) {
    
    [(#selector(v.traitCollectionDidChange(_:)), #selector(v.ksr_traitCollectionDidChange(_:)))]
        .forEach { original, swizzled in
            
            guard let originalMethod = class_getInstanceMethod(v, original),
                let swizzledMethod = class_getInstanceMethod(v, swizzled) else { return }
            
            let didAddViewDidLoadMethod = class_addMethod(v,
                                                          original,
                                                          method_getImplementation(swizzledMethod),
                                                          method_getTypeEncoding(swizzledMethod))
            
            if didAddViewDidLoadMethod {
                class_replaceMethod(v,
                                    swizzled,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod))
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
    }
}

private var hasSwizzled = false

extension UIView {
    final public class func doBadSwizzleStuff() {
        guard !hasSwizzled else { return }
        
        hasSwizzled = true
        swizzle(self)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.bindViewModel()
    }
    
    @objc open func bindStyles() {
    }
    
    @objc open func bindViewModel() {
    }
    
    @objc internal func ksr_traitCollectionDidChange(_ previousTraitCollection: UITraitCollection) {
        self.ksr_traitCollectionDidChange(previousTraitCollection)
        self.bindStyles()
    }
}
