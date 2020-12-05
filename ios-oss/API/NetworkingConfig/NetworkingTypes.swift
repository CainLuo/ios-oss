//
//  NetworkingTypes.swift
//  Litalk
//
//  Created by YYKJ0048 on 2020/4/26.
//  Copyright © 2020 ve2. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire
import OAGlobalKit

//protocol NetworkingType {
//    associatedtype T: TargetType
//    var provider: ApiProvider<T> { get }
//
//    static func defaultNetworking() -> Self
//    static func stubbingNetworking() -> Self
//}
//
//extension NetworkingType {
//    static func endpointsClosure<T>(_ xAccessToken: String? = nil) -> (T) -> Endpoint where T: TargetType {
//        return { target in
//            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
//
//            // Sign all non-XApp, non-XAuth token requests
//            return endpoint
//        }
//    }
//
//    static func APIKeysBasedStubBehaviour<T>(_: T) -> Moya.StubBehavior {
//        return .never
//    }
//
//    static var plugins: [PluginType] {
//        return []
//    }
//
//    // (Endpoint<Target>, NSURLRequest -> Void) -> Void
//    static func endpointResolver() -> MoyaProvider<T>.RequestClosure {
//        return { (endpoint, closure) in
//            do {
//                let request = try endpoint.urlRequest() // endpoint.urlRequest
//                closure(.success(request))
//            } catch {
//                log.error(error.localizedDescription)
//            }
//        }
//    }
//}
