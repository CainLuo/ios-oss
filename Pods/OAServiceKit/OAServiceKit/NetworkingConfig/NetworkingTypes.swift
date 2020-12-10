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

public protocol NetworkingType {
    associatedtype T: TargetType

//    static func provider() -> ApiProvider<T>
    static func defaultNetworking() -> Self
    static func stubbingNetworking() -> Self
}

public extension NetworkingType {
    static func endpointsClosure<T>(_ xAccessToken: String? = nil) -> (T) -> Endpoint where T: TargetType {
        return { target in
            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)

            // Sign all non-XApp, non-XAuth token requests
            return endpoint
        }
    }

    static func APIKeysBasedStubBehaviour<T>(_: T) -> Moya.StubBehavior {
        return .never
    }

    static var plugins: [PluginType] {
        return []
    }

    // (Endpoint<Target>, NSURLRequest -> Void) -> Void
    static func endpointResolver() -> MoyaProvider<T>.RequestClosure {
        return { (endpoint, closure) in
            do {
                let request = try endpoint.urlRequest() // endpoint.urlRequest
                closure(.success(request))
            } catch {
                #if DEBUG
                print("💥💥💥 Request Error: \(error.localizedDescription) 💥💥💥")
                #endif
            }
        }
    }
}
