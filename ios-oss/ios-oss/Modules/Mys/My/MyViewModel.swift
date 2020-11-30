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
}

protocol MyViewModelOutputs {
}

protocol MyViewModelTypes {
    var inputs: MyViewModelInputs { get }
    var outputs: MyViewModelOutputs { get }
}

class MyViewModel: MyViewModelInputs, MyViewModelOutputs, MyViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: MyViewModelInputs { return self }
    var outputs: MyViewModelOutputs { return self }
}
