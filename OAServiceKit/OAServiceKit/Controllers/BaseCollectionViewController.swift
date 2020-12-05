//
//  BaseCollectionViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import OAGlobalKit
import OAExtensionsKit

open class BaseCollectionViewController: UICollectionViewController {

    public let disposeBag = DisposeBag()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setBackTitleEmpty()
        log.debug(self.className)
    }
    
    deinit {
        log.debug(self.className)
    }
}
