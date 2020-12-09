//
//  NotifySetupViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol NotifySetupViewModelInputs {
}

protocol NotifySetupViewModelOutputs {
}

protocol NotifySetupViewModelTypes {
    var inputs: NotifySetupViewModelInputs { get }
    var outputs: NotifySetupViewModelOutputs { get }
}

class NotifySetupViewModel: NotifySetupViewModelInputs, NotifySetupViewModelOutputs, NotifySetupViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: NotifySetupViewModelInputs { return self }
    var outputs: NotifySetupViewModelOutputs { return self }
}
