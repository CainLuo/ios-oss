//
//  BaseTableViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

open class BaseTableViewController: UITableViewController {
    
    public let disposeBag = DisposeBag()

    open override func viewDidLoad() {
        super.viewDidLoad()
        setBackTitleEmpty()
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
