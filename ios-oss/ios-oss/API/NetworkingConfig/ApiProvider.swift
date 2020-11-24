//
//  ApiProvider.swift
//  Litalk
//
//  Created by YYKJ0048 on 2020/4/26.
//  Copyright © 2020 ve2. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire

final class ApiProvider<Target> where Target: TargetType {
    fileprivate let provider: MoyaProvider<Target>
    
    init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider<Target>.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider<Target>.neverStub,
         session: Session = session,
         plugins: [PluginType] = [],
         trackInflights: Bool = false) {
        self.provider = MoyaProvider(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, session: session, plugins: plugins, trackInflights: trackInflights)
    }
    
    func request(_ target: Target) -> Single<Moya.Response> {
        return Single.create { single -> Disposable in
            let request = self.provider.rx.request(target)
                .subscribe(onSuccess: { response in
                    do {
                        let response = try response.filterSuccessfulStatusCodes()
                        single(.success(response))
                    } catch let error {
                        let fetchError = error as NSError
                        if fetchError.code != 200 {
                            let errorMessage = (fetchError.code == 429) ? "Error_429" : "Network_Error"
                            single(.error(newError(.unknown, message: errorMessage.localized()) as Error))
                        } else {
                            single(.error(error))
                        }
                        log.severe("Error Code: \(fetchError.code), message: \(error.localizedDescription)")
                    }
                }, onError: { error in
                    let fetchError = error as NSError
                    if fetchError.code != 200 {
                        let code: ErrorCode = ErrorCode(rawValue: fetchError.code) ?? .unknown
                        let errorMessage = (fetchError.code == 429) ? "Error_429" : "Network_Error"
                        single(.error(newError(code, message: errorMessage.localized()) as Error))
                    } else {
                        single(.error(error))
                    }
                    log.severe("Error Code: \(fetchError.code), message: \(error.localizedDescription)")
                })
            
            return Disposables.create { request.dispose() }
        }
    }
}
