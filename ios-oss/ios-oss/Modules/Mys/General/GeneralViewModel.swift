//
//  GeneralViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol GeneralViewModelInputs {
}

protocol GeneralViewModelOutputs {
}

protocol GeneralViewModelTypes {
    var inputs: GeneralViewModelInputs { get }
    var outputs: GeneralViewModelOutputs { get }
}

class GeneralViewModel: GeneralViewModelInputs, GeneralViewModelOutputs, GeneralViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: GeneralViewModelInputs { return self }
    var outputs: GeneralViewModelOutputs { return self }
}
