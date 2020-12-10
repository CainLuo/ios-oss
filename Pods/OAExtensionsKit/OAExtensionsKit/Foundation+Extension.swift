//
//  Foundation+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Foundation

private let formatter: NumberFormatter = NumberFormatter()

extension Int {
    public func formattedString(style: NumberFormatter.Style, localeIdentifier: String) -> String {
        formatter.numberStyle = style
        formatter.locale = Locale(identifier: localeIdentifier)
        return formatter.string(from: self as NSNumber) ?? ""
    }
}

// MARK: Int Translation
extension Int {
    public var asString: String {
        return String(self)
    }
    
    public var asDouble: Double {
        return Double(self)
    }
    
    public var decimalString: String {
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        return formatter.string(from: self as NSNumber) ?? ""
    }
    
    public func toString() -> String? {
        return String(self)
    }
}

// MARK: Double Translation
extension Double {
    public var oneDecimal: String {
        return String(format: self == 0 ? "%.0f" : "%0.1f" , self)
    }
    
    public var twoDecimal: String {
        return String(format: self == 0 ? "%.0f" : "%0.2f" , self)
    }
}
