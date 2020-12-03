//
//  PersonalViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol PersonalViewModelInputs {
}

protocol PersonalViewModelOutputs {
}

protocol PersonalViewModelTypes {
    var inputs: PersonalViewModelInputs { get }
    var outputs: PersonalViewModelOutputs { get }
}

class PersonalViewModel: PersonalViewModelInputs, PersonalViewModelOutputs, PersonalViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: PersonalViewModelInputs { return self }
    var outputs: PersonalViewModelOutputs { return self }
}
