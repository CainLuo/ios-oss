//
//  ShareManager.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/12/10.
//

import Foundation

// MARK: Platform Share
public class ShareManager {
    /// 调起分享的方法
    /// SSDKResponseState 是用于获取分享各种状态码
    /// - Parameters:
    ///   - vc: 需要调起分享的UIViewController
    ///   - type: SSDKPlatformType, 对应的各大平台类型
    ///   - shareURL: 需要分享的URL
    ///   - imageURL: 需要分享图片的URL
    ///   - completion: 返回对应的 SSDKResponseState 和 Error
    public static func share(_ vc: UIViewController, type: SSDKPlatformType, shareURL: URL?, imageURL: URL?, completion: @escaping((SSDKResponseState, Error?) -> Void)) {
        let parameters = configParameters(type: type, shareURL: shareURL, imageURL: imageURL)
        
        ShareSDK.share(type, parameters: parameters) { (state, userData, contentEntity, error) in
            completion(state, error)
        }
    }
    
    /// 私有方法: 分享内容的设置
    /// - Parameters:
    ///   - type: SSDKPlatformType, 对应的各大平台类型
    ///   - shareURL: 需要分享的URL
    ///   - imageURL: 需要分享图片的URL
    /// - Returns: 返回设置好的NSMutableDictionary
    static private func configParameters(type: SSDKPlatformType, shareURL: URL?, imageURL: URL?) -> NSMutableDictionary {
        let parameters: NSMutableDictionary = NSMutableDictionary()
        
        if let url = shareURL,
            let imageURL = imageURL {
            parameters.ssdkSetupLineParams(byText: url.absoluteString, image: nil, type: .auto)
            parameters.ssdkSetupFacebookParams(byText: "", image: imageURL, url: url,
                                               urlTitle: "", urlName: nil, attachementUrl: nil, hashtag: nil,
                                               quote: nil, shareType: .native, type: .webPage)
        }
        
        return parameters
    }
}

// MARK: Apple Sign
extension ShareManager {
    /// Apple 登录
    /// 如果要获取原始的JSON数据可以使用 SSDKUser 自带的 dictionaryValue() 获取
    /// SSDKResponseState则是返回登录的状态码
    /// - Parameter completion: 返回对应的SSDKResponseState, SSDKUser?, Error?
    public static func appleSign(_ completion: @escaping((SSDKResponseState, SSDKUser?, Error?) -> Void)) {
        ShareSDK.authorize(.typeAppleAccount, settings: [:]) { (state, user, error) in
            completion(state, user, error)
        }
    }
    
    /// 监听Apple登录状态
    /// - Parameters:
    ///   - object: 用于监听Apple登录状态, 比如AppDelegate, 也可以与登录页面进行生命周期的绑定
    ///   - completion: 返回对应的SSDKResponseState, SSDKUser?, Error?
    public static func authorizeAppleSign(_ object: Any, completion: @escaping((SSDKAppleAccountState, Dictionary<AnyHashable, Any>?, Error?) -> Void)) {
        AppleAccountConnector.addObserve(object, isFirstAddCallBack: true) { (state, user, error) in
            completion(state, user.dictionaryValue(), error)
        }
    }
}

// MARK: Facebook Sign
extension ShareManager {
    /// Facebook 登录
    /// 由于支持网页登录, 第一次页面授权后就无法切换成其他的用户, 需要自行去清理Safari的缓存
    /// 如果要获取原始的JSON数据可以使用 SSDKUser 自带的 dictionaryValue() 获取
    /// SSDKResponseState则是返回登录的状态码
    /// - Parameter completion: 返回对应的SSDKResponseState, SSDKUser?, Error?
    public static func facebookSign(_ completion: @escaping((SSDKResponseState, SSDKUser?, Error?) -> Void)) {
        ShareSDK.authorize(.typeFacebookAccount, settings: ["isBrowser": true]) { (state, user, error) in
            completion(state, user, error)
        }
    }
}
