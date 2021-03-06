//
//  Constants.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Foundation

struct Constants {
    enum Protocols {
        static let userProtocol = ""
        static let privacyProtocol = ""
    }
    
    enum ErrorCode: Int {
        case success = 0
    }
}

extension Constants {
    enum Scheme {
        static let my = URL(string: "productScheme://ModuleMy")!
        static let login = URL(string: "productScheme://ModuleLogin")!
        static let launch = URL(string: "productScheme://ModuleLaunch")!
    }
}
