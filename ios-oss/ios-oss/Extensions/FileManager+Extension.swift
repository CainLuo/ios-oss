//
//  FileManager+Extension.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Foundation

// MARK: Directory Paths
extension FileManager {
    static func documentURL() -> URL? {
        var url: URL?
        do {
            url = try self.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        } catch {
            log.debug(error)
        }
        return url
    }
    
    static func cachePathURL() -> URL? {
        var url: URL?
        do {
            url = try self.default
                .url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        } catch {
            log.debug(error)
        }
        return url
    }
    
    static func supportPathURL() -> URL? {
        var url: URL?
        do {
            url = try self.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        } catch {
            log.debug(error)
        }
        return url
    }
}

extension FileManager {
    static func createFilePath(_ name: String) -> String? {
        let chatPath = documentURL()?.absoluteString.appending("/\(name)")
        log.debug(documentURL())
        
        guard let filePath = chatPath else { return nil }
                
        if !FileManager.default.fileExists(atPath: filePath) {
            do {
                try FileManager.default.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
                return filePath
            } catch {
                log.error("create chat background path error: \(error)")
            }
        }
        return filePath
    }
    
    static func checkHasFile(_ path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
    
    static func checkDirectoryHasFiels(_ path: String) -> Bool {
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let localPath = documentPath?.appending("/\(path)")
        guard let path = localPath else { return false }
        return FileManager.getFileCount(path) > 0
    }
    
    static func moveFile(_ path: String, toPath: String) {
        do {
            try FileManager.default.moveItem(atPath: path, toPath: toPath)
        } catch {
            log.debug("Failed to move file: \(error.localizedDescription)")
            if FileManager.default.fileExists(atPath: toPath) {
                removeFile(path)
            }
        }
    }
    
    static func removeFile(_ path: String) {
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch {
            log.debug("Failed to remove file: \(error.localizedDescription)")
        }
    }
    
    static func getFileCount (_ path: String) -> Int {
        let fileCount = FileManager.default.enumerator(atPath: path)?.allObjects.count
        return fileCount ?? 0
    }
}
