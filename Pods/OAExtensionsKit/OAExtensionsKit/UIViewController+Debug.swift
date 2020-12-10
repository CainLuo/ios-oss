//
//  UIViewController+Debug.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import WebKit

// MARK: Add Debug Bar Button Item
extension UIViewController {
    @objc func configDebugBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(title: "(Debug)", style: .plain, target: self, action: #selector(showAlertController))
    }
    
    @objc private func showAlertController() {
        let vc = UIAlertController(title: "切换域名环境", message: nil, preferredStyle: .actionSheet)
        
        let debug = UIAlertAction(title: "测试环境", style: .default) { _ in
            self.removeDocuments()
            
//            YAIHostManager.share()?.lt_changeHost(with: .test)
//            if let host = YAIHostManager.share()?.getCurrentHost() {
//                LTProgressHUD.show("切换环境为:\(host)")
//            }
        }
        
        let preview = UIAlertAction(title: "预生产环境", style: .default) { _ in
            self.removeDocuments()
            
//            YAIHostManager.share()?.lt_changeHost(with: .preview)
//            if let host = YAIHostManager.share()?.getCurrentHost() {
//                LTProgressHUD.show("切换环境为:\(host)")
//            }
        }

        let product = UIAlertAction(title: "生产环境", style: .default) { _ in
            self.removeDocuments()
            
//            YAIHostManager.share()?.lt_changeHost(with: .release)
//            if let host = YAIHostManager.share()?.getCurrentHost() {
//                LTProgressHUD.show("切换环境为:\(host)")
//            }
        }
        
        let cancel = UIAlertAction(title: "取消", style: .cancel) { _ in }

        vc.addAction(debug)
        vc.addAction(preview)
        vc.addAction(product)
        vc.addAction(cancel)

        present(vc, animated: true, completion: nil)
    }
    
    private func removeDocuments() {
//        if YAIAccountSettingManager.yai_getUserID() != nil {
//            KeyValueStore.instantiate().clearUserInfo()
//        }
        WKWebsiteDataStore.default().removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: Date(timeIntervalSince1970: 0)) {
            #if DEBUG
            print("⚠️⚠️⚠️----------------------------------删除浏览器缓存成功----------------------------------⚠️⚠️⚠️")
            #endif
        }
        
//        YAIAttachmentCacheManager().removeAllAttachmentDatas { (isOK) in
//            log.warning(isOK ? "删除缓存成功" : "删除缓存失败")
//        }

        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: documentsUrl,
                                                                       includingPropertiesForKeys: nil,
                                                                       options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
            
            for fileURL in fileURLs {
                try FileManager.default.removeItem(at: fileURL)
            }
            #if DEBUG
            print("⚠️⚠️⚠️----------------------------------删除成功----------------------------------⚠️⚠️⚠️")
            #endif
        } catch  {
            #if DEBUG
            print("💥💥💥----------------------------------Error:  \(error.localizedDescription)----------------------------------💥💥💥")
            #endif
        }
    }
}
