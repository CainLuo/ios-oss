//
//  QRCodeViewModel.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import Foundation
import RxSwift
import RxCocoa

protocol QRCodeViewModelInputs {
}

protocol QRCodeViewModelOutputs {
}

protocol QRCodeViewModelTypes {
    var inputs: QRCodeViewModelInputs { get }
    var outputs: QRCodeViewModelOutputs { get }
}

class QRCodeViewModel: QRCodeViewModelInputs, QRCodeViewModelOutputs, QRCodeViewModelTypes {
    
    init() {
        
        // inputs
        
        // outputs
    }
    
    // MARK: subjects
    
    // MARK: inputs
    
    // MARK: outputs
    
    var inputs: QRCodeViewModelInputs { return self }
    var outputs: QRCodeViewModelOutputs { return self }
}
