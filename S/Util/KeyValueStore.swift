//
//  KeyValueStore.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Foundation
enum AppKeys: String {
    case isFirstOpenKey = "isFirstOpenKey"
}

protocol KeyValueStoreTypes: class {
    func set(_ value: Bool, forKey defaultName: String)
    func set(_ value: Int, forKey defaultName: String)
    func set(_ value: Any?, forKey defaultName: String)
    
    func double(forKey defaultName: String) -> Double
    func bool(forKey defaultName: String) -> Bool
    func dictionary(forKey defaultName: String) -> [String: Any]?
    func array(forKey defaultName: String) -> [Any]?
    func integer(forKey defaultName: String) -> Int
    func object(forKey defaultName: String) -> Any?
    func string(forKey defaultName: String) -> String?
    func synchronize() -> Bool
}

extension KeyValueStoreTypes {
    func logout() {
    }
        
    func clearUserInfo() {
    }
}

extension UserDefaults: KeyValueStoreTypes { }

// MARK: MockKeyValueStore
public class MockKeyValueStore: KeyValueStoreTypes {
    public var store: [String: Any] = [:]
    
    public func set(_ value: Bool, forKey defaultName: String) {
        self.store[defaultName] = value
    }
    
    public func set(_ value: Int, forKey defaultName: String) {
        self.store[defaultName] = value
    }
    
    public func set(_ value: Any?, forKey key: String) {
        self.store[key] = value
    }
    
    public func bool(forKey defaultName: String) -> Bool {
        return self.store[defaultName] as? Bool ?? false
    }
    
    public func dictionary(forKey key: String) -> [String: Any]? {
        return self.object(forKey: key) as? [String: Any]
    }
    
    public func array(forKey defaultName: String) -> [Any]? {
        return self.object(forKey: defaultName) as? [Any]
    }

    public func integer(forKey defaultName: String) -> Int {
        return self.store[defaultName] as? Int ?? 0
    }
    
    public func object(forKey key: String) -> Any? {
        return self.store[key]
    }
    
    public func string(forKey defaultName: String) -> String? {
        return self.store[defaultName] as? String
    }
    
    public func double(forKey defaultName: String) -> Double {
        return self.store[defaultName] as? Double ?? 0
    }
    
    public func removeObject(forKey defaultName: String) {
        self.set(nil, forKey: defaultName)
    }
    
    public func synchronize() -> Bool {
        return UserDefaults.standard.synchronize()
    }
    
    public init() {
        
    }
}

// MARK: Key Value Store
class KeyValueStore {
    static func instantiate() -> KeyValueStoreTypes {
        return UserDefaults.standard
    }
}
