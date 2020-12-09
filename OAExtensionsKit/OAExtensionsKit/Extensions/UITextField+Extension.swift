//
//  UITextField+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

// MARK: UITextField
private var maxLengths = [UITextField: Int]()
private var minLengths = [UITextField: Int]()

public extension UITextField {
    func checkLength(max: Int) {
        guard let text = text else {
            return
        }
        
        if text.count > max {
            self.text = String(text.prefix(max))
        }
    }
}

public extension UITextField {
    @IBInspectable var minLength: Int {
        get {
            guard let length = minLengths[self] else {
                return 0
            }
            
            return length
        }
        set {
            minLengths[self] = newValue
        }
    }
    
    @IBInspectable var maxLength: Int {
        get {
            guard let length = maxLengths[self] else {
                return Int.max
            }
            
            return length
        }
        set {
            maxLengths[self] = newValue
            
            addTarget(self,
                      action: #selector(limitLength),
                      for: .editingChanged)
        }
    }
    
    @objc func limitLength(textField: UITextField) {
        guard let prospectiveText = textField.text, prospectiveText.count > maxLength else {
            return
        }
        
        textField.text = String(prospectiveText.prefix(maxLength))
    }
}

public extension UITextField {
    @IBInspectable var placeholderLocalized: String {
        set {
            placeholder = newValue.localized()
        }
        get {
            return self.placeholderLocalized.localized()
        }
    }
    
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

