//
//  NicheViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol NicheViewModelInputs {
}

protocol NicheViewModelOutputs {
}

protocol NicheViewModelTypes {
    var inputs: NicheViewModelInputs { get }
    var outputs: NicheViewModelOutputs { get }
}

class NicheViewModel: NicheViewModelInputs, NicheViewModelOutputs, NicheViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: NicheViewModelInputs { return self }
    var outputs: NicheViewModelOutputs { return self }
}
