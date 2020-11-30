//
//  NotifyListViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol NotifyListViewModelInputs {
}

protocol NotifyListViewModelOutputs {
}

protocol NotifyListViewModelTypes {
    var inputs: NotifyListViewModelInputs { get }
    var outputs: NotifyListViewModelOutputs { get }
}

class NotifyListViewModel: NotifyListViewModelInputs, NotifyListViewModelOutputs, NotifyListViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: NotifyListViewModelInputs { return self }
    var outputs: NotifyListViewModelOutputs { return self }
}
