//
//  BaseNavigationController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import HBDNavigationBar

open class BaseNavigationController: HBDNavigationController {

    public let disposeBag = DisposeBag()

    open override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        print("⚠️⚠️⚠️viewDidLoad: \(self.className) ⚠️⚠️⚠️")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("⚠️⚠️⚠️deinit: \(self.className)⚠️⚠️⚠️")
        #endif
    }
}
