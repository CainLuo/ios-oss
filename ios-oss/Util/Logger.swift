//
//  Logger.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Foundation
import XCGLogger

public let log: XCGLogger = {
    let log = XCGLogger.default
    
    log.setup(level: .debug, showLogIdentifier: true, showFunctionName: true,
              showThreadName: true, showLevel: true, showFileNames: true,
              showLineNumbers: true, showDate: true, writeToFile: nil, fileLevel: .debug)
    
    let logFormat = PrePostFixLogFormatter()
    
    logFormat.apply(prefix: "🗯🗯🗯", postfix: "🗯🗯🗯", to: .verbose)
    logFormat.apply(prefix: "🔹🔹🔹", postfix: "🔹🔹🔹", to: .debug)
    logFormat.apply(prefix: "ℹ️ℹ️ℹ️", postfix: "ℹ️ℹ️ℹ️", to: .info)
    logFormat.apply(prefix: "⚠️⚠️⚠️", postfix: "⚠️⚠️⚠️", to: .warning)
    logFormat.apply(prefix: "❌❌❌", postfix: "❌❌❌", to: .error)
    logFormat.apply(prefix: "💥💥💥", postfix: "💥💥💥", to: .severe)
    
    log.formatters = [logFormat]
    
    return log
}()
