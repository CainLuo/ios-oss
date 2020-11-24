//
//  BaseCollectionViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackTitleEmpty()
        log.debug(self.className)
    }
    
    deinit {
        log.debug(self.className)
    }
}
