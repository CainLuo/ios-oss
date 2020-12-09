//
//  CommentsViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol CommentsViewModelViewModelInputs {
}

protocol CommentsViewModelViewModelOutputs {
}

protocol CommentsViewModelViewModelTypes {
    var inputs: CommentsViewModelViewModelInputs { get }
    var outputs: CommentsViewModelViewModelOutputs { get }
}

class CommentsViewModelViewModel: CommentsViewModelViewModelInputs, CommentsViewModelViewModelOutputs, CommentsViewModelViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: CommentsViewModelViewModelInputs { return self }
    var outputs: CommentsViewModelViewModelOutputs { return self }
}
