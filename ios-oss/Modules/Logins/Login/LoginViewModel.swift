//
//  LoginViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/25.
//

import Foundation
import RxSwift
import RxCocoa
import OAGlobalKit
import OAServiceKit

protocol LoginViewModelInputs {
    var viewWillAppear: AnyObserver<Void> { get }
    
    func viewDidLoad()
}

protocol LoginViewModelOutputs {
    var error: Driver<Error> { get }
    var isLoading: Driver<Bool> { get }
    var loadSuccess: Driver<String> { get }
}

protocol LoginViewModelTypes {
    var inputs: LoginViewModelInputs { get }
    var outputs: LoginViewModelOutputs { get }
}

class LoginViewModel: LoginViewModelInputs, LoginViewModelOutputs, LoginViewModelTypes {
    
    init() {
        let error = ErrorTracker()
        let isLoading = ActivityIndicator()
//        let apiServer: ApiServiceType = ApiService()
//
//        let requestSuccess = viewWillAppearSubject
//            .flatMap {
//                apiServer.login()
//                    .trackError(error)
//                    .trackActivity(isLoading)
//                    .asDriverOnErrorJustComplete()
//            }.share()
//
//        _ = requestSuccess.subscribe(onNext: { result in
//                log.debug(result)
//            })

        // inputs
        self.viewWillAppear = viewWillAppearSubject.asObserver()
        
        // outputs
        self.error = error.asDriver()
        self.isLoading = isLoading.asDriver()
        self.loadSuccess = viewDidLoadSubject.asDriverOnErrorJustComplete()
    }
    
    // MARK: subjects
    let viewWillAppearSubject = PublishSubject<Void>()
    let viewDidLoadSubject = PublishSubject<String>()

    // MARK: inputs
    var viewWillAppear: AnyObserver<Void>
    
    func viewDidLoad() {
        viewDidLoadSubject.onNext("Hello Word")
    }

    // MARK: outputs
    let error: Driver<Error>
    let isLoading: Driver<Bool>
    let loadSuccess: Driver<String>

    var inputs: LoginViewModelInputs { return self }
    var outputs: LoginViewModelOutputs { return self }
}
