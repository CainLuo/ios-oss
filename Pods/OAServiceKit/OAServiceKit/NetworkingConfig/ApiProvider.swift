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

public class ApiProvider<Target> where Target: TargetType {
    fileprivate let provider: MoyaProvider<Target>
    
    public init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider<Target>.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider<Target>.neverStub,
         session: Session = session,
         plugins: [PluginType] = [],
         trackInflights: Bool = false) {
        self.provider = MoyaProvider(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, session: session, plugins: plugins, trackInflights: trackInflights)
    }
    
    public func request(_ target: Target) -> Single<Moya.Response> {
        return Single.create { single -> Disposable in
            let request = self.provider.rx.request(target)
                .subscribe(onSuccess: { response in
                    do {
                        let response = try response.filterSuccessfulStatusCodes()
                        single(.success(response))
                    } catch let error {
                        let fetchError = error as NSError
                        single(.error(error))
                        #if DEBUG
                        print("💥💥💥 Error Code: \(fetchError.code), message: \(error.localizedDescription) 💥💥💥")
                        #endif
                    }
                }, onError: { error in
                    let fetchError = error as NSError
                    single(.error(error))
                    #if DEBUG
                    print("💥💥💥 Error Code: \(fetchError.code), message: \(error.localizedDescription) 💥💥💥")
                    #endif
                })
            
            return Disposables.create { request.dispose() }
        }
    }
}
