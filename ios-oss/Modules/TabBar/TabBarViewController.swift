//
//  TabBarViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

class TabBarViewController: BaseTabBarController {

    static func configureWith() -> TabBarViewController {
        let vc = Storyboard.TabBar.instantiate(TabBarViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        rx.didSelect
            .subscribe(onNext: { navi in
                if let navi = navi as? BaseNavigationController,
                   let vc = navi.topViewController {
                    log.debug(vc)
                }
            })
            .disposed(by: disposeBag)
    }
}
