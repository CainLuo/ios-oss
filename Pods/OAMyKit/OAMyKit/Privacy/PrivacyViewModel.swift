//
//  PrivacyViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol PrivacyViewModelInputs {
}

protocol PrivacyViewModelOutputs {
}

protocol PrivacyViewModelTypes {
    var inputs: PrivacyViewModelInputs { get }
    var outputs: PrivacyViewModelOutputs { get }
}

class PrivacyViewModel: PrivacyViewModelInputs, PrivacyViewModelOutputs, PrivacyViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: PrivacyViewModelInputs { return self }
    var outputs: PrivacyViewModelOutputs { return self }
}
