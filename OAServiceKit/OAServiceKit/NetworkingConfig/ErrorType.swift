//
//  ErrorType.swift
//  Litalk
//
//  Created by YYKJ0048 on 2020/4/27.
//  Copyright © 2020 ve2. All rights reserved.
//

import Foundation

public enum ErrorCode: Int {
    case unknown
    case invalidPassword
    case result
    case business
    case ipRestricted
    case illegalRequest
    case timeout
}

public func newError(_ code: ErrorCode, message: String? = nil) -> NSError {
    
    let errorDomain = "com.serviceKit.error"
    
    let userInfo: [String : Any] = [NSLocalizedDescriptionKey: message ?? ""]
    let returnError = NSError(domain: errorDomain, code: code.rawValue, userInfo: userInfo)
    
    return returnError
}
