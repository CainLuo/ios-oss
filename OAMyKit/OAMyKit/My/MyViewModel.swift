//
//  MyViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa
import OAServiceKit
import OAGlobalKit

protocol MyViewModelInputs {
    var viewWillAppear: AnyObserver<Void> { get }
}

protocol MyViewModelOutputs {
    var error: Driver<Error> { get }
    var isLoading: Driver<Bool> { get }
    var title: Driver<String> { get }
    var sections: Driver<[MySectionModel]> { get }
}

protocol MyViewModelTypes {
    var inputs: MyViewModelInputs { get }
    var outputs: MyViewModelOutputs { get }
}

class MyViewModel: MyViewModelInputs, MyViewModelOutputs, MyViewModelTypes {
    
    init() {
        let error = ErrorTracker()
        let isLoading = ActivityIndicator()
        let apiServer: ApiServiceType = ApiService()
        
        let profile = viewWillAppearSubject
            .flatMap {
                apiServer.profile()
                    .trackError(error)
                    .trackActivity(isLoading)
                    .asDriverOnErrorJustComplete()
            }
            .share()
        
        let sections = viewWillAppearSubject.map(filterDataSource)
        
        _ = profile.subscribe(onNext: { result in
                log.debug(result)
            })

        // inputs
        self.viewWillAppear = viewWillAppearSubject.asObserver()
        
        // outputs
        self.error = error.asDriver()
        self.isLoading = isLoading.asDriver()
        self.title = viewWillAppearSubject.map { "My_Title".localized() }.asDriverOnErrorJustComplete()
        self.sections = sections.asDriverOnErrorJustComplete()
    }
    
    // MARK: subjects
    let viewWillAppearSubject = PublishSubject<Void>()
    
    // MARK: inputs
    let viewWillAppear: AnyObserver<Void>
    let sections: Driver<[MySectionModel]>

    // MARK: outputs
    let error: Driver<Error>
    let isLoading: Driver<Bool>
    let title: Driver<String>

    var inputs: MyViewModelInputs { return self }
    var outputs: MyViewModelOutputs { return self }
}

private func filterDataSource() -> [MySectionModel] {
    return [filterProfileSection(),
            filterCommercesSection(),
            filterPersonalSection(),
            filterManagementSection()]
}

private func filterProfileSection() -> MySectionModel {
    return MySectionModel(type: .profile, profile: nil)
}

private func filterCommercesSection() -> MySectionModel {
    return MySectionModel(type: .commerces, commerces: nil)
}

private func filterPersonalSection() -> MySectionModel {
    let items = [MyItemModel(title: "1", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "2", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "3", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "4", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "5", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "6", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "7", icon: UIImage(named: "profile_header"), moduleURL: URL(string: ""))]
    return MySectionModel(type: .personal, sectionTitle: "个人中心", items: items)
}

private func filterManagementSection() -> MySectionModel {
    let items = [MyItemModel(title: "1", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "2", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "3", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "4", icon: UIImage(named: "profile_header"), moduleURL: URL(string: "")),
                 MyItemModel(title: "5", icon: UIImage(named: "profile_header"), moduleURL: URL(string: ""))]
    return MySectionModel(type: .management, sectionTitle: "商会管理", items: items)
}
