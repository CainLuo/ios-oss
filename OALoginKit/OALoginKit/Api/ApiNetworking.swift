//
//  ApiNetworking.swift
//  Litalk
//
//  Created by YYKJ0048 on 2020/4/26.
//  Copyright © 2020 ve2. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire
import OAServiceKit

struct ApiNetworking: NetworkingType {
    typealias T = Router
    let provider: ApiProvider<T>

    static func defaultNetworking() -> ApiNetworking {
        return ApiNetworking(provider: newProvider(plugins))
    }

    static func stubbingNetworking() -> ApiNetworking {
        return ApiNetworking(provider: ApiProvider(endpointClosure: endpointsClosure(),
                                                   requestClosure: ApiNetworking.endpointResolver(),
                                                   stubClosure: MoyaProvider.immediatelyStub))
    }

    func request(_ token: T) -> Single<Response> {
        let actualRequest = self.provider.request(token)
        return actualRequest
    }
}

private func newProvider<T>(_ plugins: [PluginType], xAccessToken: String? = nil) -> ApiProvider<T> {
    return ApiProvider(endpointClosure: ApiNetworking.endpointsClosure(xAccessToken),
                       requestClosure: ApiNetworking.endpointResolver(),
                       stubClosure: ApiNetworking.APIKeysBasedStubBehaviour,
                       plugins: plugins)
}
