//
//  BaseCollectionViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

class BaseCollectionViewController: UICollectionViewController {

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackTitleEmpty()
        log.debug(self.className)
    }
    
    deinit {
        log.debug(self.className)
    }
}
