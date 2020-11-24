//
//  Router.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Moya
import Alamofire

enum Router {
    case login
}

extension Router: TargetType {
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
        
        case .login:
            return ""
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .login:
//            LTLog.startRequest(withUrl: self.baseURL.absoluteString + self.path, params: parameters, type: self.method.rawValue)
//            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
//        case .getNewFriendsList(let parameters):
//            LTLog.startRequest(withUrl: self.baseURL.absoluteString + self.path, params: parameters, type: self.method.rawValue)
//            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
//        default:
//            LTLog.startRequest(withUrl: self.baseURL.absoluteString + self.path, params: nil, type: self.method.rawValue)
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let headers = ["Content-Type": "application/json",
                       "Referer": "https://litalk.com/"]
//        if let token = YAIAccountSettingManager.yai_getUserToken() {
//            headers.updateValue(token, forKey: "X-TOKEN")
//        }
        
//        if let device = YAIDeviceManeger.shareManager()?.getDeviceHeadMessage() {
//            headers.updateValue(device, forKey: "X-DEVICE")
//        }
        
//        if let userAgent = YAIDeviceManeger.shareManager()?.getUserUserAgent() {
//            headers.updateValue(userAgent, forKey: "User-Agent")
//        }
        return headers
    }
}
