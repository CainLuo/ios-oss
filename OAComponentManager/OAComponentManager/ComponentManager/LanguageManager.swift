//
//  LanguageManager.swift
//  OAComponentManager
//
//  Created by YYKJ0048 on 2020/12/2.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    
    func preferredLanguage() -> String {
        return Locale.preferredLanguages.first ?? ""
    }
}

extension String {
    func localized(_ tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, comment: "")
    }
}
