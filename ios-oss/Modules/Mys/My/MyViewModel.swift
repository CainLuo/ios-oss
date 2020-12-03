//
//  MyViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol MyViewModelInputs {
    var viewWillAppear: AnyObserver<Void> { get }
}

protocol MyViewModelOutputs {
    var title: Driver<String> { get }
    var collectionTitle: Driver<String> { get }
    var followTitle: Driver<String> { get }
    var commentTitle: Driver<String> { get }
    var qrCodeTitle: Driver<String> { get }
    var certifiedTitle: Driver<String> { get }
    var notifyListTitle: Driver<String> { get }
    var nicheTitle: Driver<String> { get }
    var notifySetupTitle: Driver<String> { get }
    var privacyTitle: Driver<String> { get }
    var generalTitle: Driver<String> { get }
    var aboutTitle: Driver<String> { get }
    var feedbackTitle: Driver<String> { get }
    var logoutTitle: Driver<String> { get }
}

protocol MyViewModelTypes {
    var inputs: MyViewModelInputs { get }
    var outputs: MyViewModelOutputs { get }
}

class MyViewModel: MyViewModelInputs, MyViewModelOutputs, MyViewModelTypes {
    
    init() {
        
        // inputs
        self.viewWillAppear = viewWillAppearSubject.asObserver()
        
        // outputs
        self.title = viewWillAppearSubject.map { "My_Title".localized() }.asDriverOnErrorJustComplete()
        self.collectionTitle = viewWillAppearSubject.map { "My_Collection".localized() }.asDriverOnErrorJustComplete()
        self.followTitle = viewWillAppearSubject.map { "My_Follow".localized() }.asDriverOnErrorJustComplete()
        self.commentTitle = viewWillAppearSubject.map { "My_Comment".localized() }.asDriverOnErrorJustComplete()
        self.qrCodeTitle = viewWillAppearSubject.map { "My_QRCode".localized() }.asDriverOnErrorJustComplete()
        self.certifiedTitle = viewWillAppearSubject.map { "My_Certified".localized() }.asDriverOnErrorJustComplete()
        self.notifyListTitle = viewWillAppearSubject.map { "My_NotifyList".localized() }.asDriverOnErrorJustComplete()
        self.nicheTitle = viewWillAppearSubject.map { "My_Niche".localized() }.asDriverOnErrorJustComplete()
        self.notifySetupTitle = viewWillAppearSubject.map { "My_NotifySetup".localized() }.asDriverOnErrorJustComplete()
        self.privacyTitle = viewWillAppearSubject.map { "My_Privacy".localized() }.asDriverOnErrorJustComplete()
        self.generalTitle = viewWillAppearSubject.map { "My_General".localized() }.asDriverOnErrorJustComplete()
        self.aboutTitle = viewWillAppearSubject.map { "My_About".localized() }.asDriverOnErrorJustComplete()
        self.feedbackTitle = viewWillAppearSubject.map { "My_Feedback".localized() }.asDriverOnErrorJustComplete()
        self.logoutTitle = viewWillAppearSubject.map { "My_Logout".localized() }.asDriverOnErrorJustComplete()
    }
    
    // MARK: subjects
    let viewWillAppearSubject = PublishSubject<Void>()
    
    // MARK: inputs
    let viewWillAppear: AnyObserver<Void>

    // MARK: outputs
    let title: Driver<String>
    let collectionTitle: Driver<String>
    let followTitle: Driver<String>
    let commentTitle: Driver<String>
    let qrCodeTitle: Driver<String>
    let certifiedTitle: Driver<String>
    let notifyListTitle: Driver<String>
    let nicheTitle: Driver<String>
    let notifySetupTitle: Driver<String>
    let privacyTitle: Driver<String>
    let generalTitle: Driver<String>
    let aboutTitle: Driver<String>
    let feedbackTitle: Driver<String>
    let logoutTitle: Driver<String>

    var inputs: MyViewModelInputs { return self }
    var outputs: MyViewModelOutputs { return self }
}
