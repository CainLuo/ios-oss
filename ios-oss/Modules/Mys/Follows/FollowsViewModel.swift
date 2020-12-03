//
//  FollowsViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol FollowsViewModelInputs {
}

protocol FollowsViewModelOutputs {
}

protocol FollowsViewModelTypes {
    var inputs: FollowsViewModelInputs { get }
    var outputs: FollowsViewModelOutputs { get }
}

class FollowsViewModel: FollowsViewModelInputs, FollowsViewModelOutputs, FollowsViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: FollowsViewModelInputs { return self }
    var outputs: FollowsViewModelOutputs { return self }
}
