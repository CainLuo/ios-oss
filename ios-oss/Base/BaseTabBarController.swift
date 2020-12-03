//
//  BaseTabBarController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

class BaseTabBarController: UITabBarController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug(self.className)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tabBar.hiddenShadow()
    }
    
    deinit {
        log.debug(self.className)
    }
}
