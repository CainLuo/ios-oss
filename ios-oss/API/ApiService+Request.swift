//
//  ApiService.swift
//  Litalk
//
//  Created by YYKJ0048 on 2020/3/10.
//  Copyright © 2020 ve2. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper
import OAServiceKit

// MARK: Moya Request Extension
extension ApiService {
    func request(_ target: Router) -> Single<Any> {
        return apiProvider.request(target)
            .mapJSON()
            .observeOn(MainScheduler.instance)
    }
    
    func requestWithoutMapping(_ target: Router) -> Single<Moya.Response> {
        return apiProvider.request(target)
            .observeOn(MainScheduler.instance)
    }
    
    func requestObject<T: BaseMappable>(_ target: Router, type: T.Type) -> Single<T> {
        return apiProvider.request(target)
            .mapObject(T.self)
            .do(onSuccess: { data in
//                if let model = CodeResponse(JSON: data.toJSON()) {
//                    LTLog.requestSuccessLog(withUrl: target.baseURL.absoluteString + target.path, type: target.method.rawValue, code: model.code.rawValue)
//                }
            }, onError: { error in
//                if let nsError = error as NSError? {
//                    LTLog.requestFail(withUrl: target.baseURL.absoluteString + target.path, type: target.method.rawValue, code: nsError.code)
//                }
            })
            .observeOn(MainScheduler.instance)
    }
    
    func requestArray<T: BaseMappable>(_ target: Router, type: T.Type) -> Single<[T]> {
        return apiProvider.request(target)
            .mapArray(T.self)
            .observeOn(MainScheduler.instance)
    }
}
