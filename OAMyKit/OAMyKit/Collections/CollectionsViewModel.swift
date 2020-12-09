//
//  CollectionsViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol CollectionsViewModelInputs {
}

protocol CollectionsViewModelOutputs {
}

protocol CollectionsViewModelTypes {
    var inputs: CollectionsViewModelInputs { get }
    var outputs: CollectionsViewModelOutputs { get }
}

class CollectionsViewModel: CollectionsViewModelInputs, CollectionsViewModelOutputs, CollectionsViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: CollectionsViewModelInputs { return self }
    var outputs: CollectionsViewModelOutputs { return self }
}
