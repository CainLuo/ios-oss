//
//  LoginModuleConnectors.swift
//  OALoginKit
//
//  Created by CainLuo on 2020/12/5.
//

import Foundation

public class LoginModuleConnectors {
    
    public static func register() {
        ForgetConnector.instance().register()
        LoginConnector.instance().register()
        FindPasswordConnector.instance().register()
    }
}
