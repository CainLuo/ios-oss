//
//  TabBarViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import OAGlobalKit
import OAMyKit
//import OALoginKit
import OAServiceKit

class TabBarViewController: BaseTabBarController {

    static func configureWith() -> TabBarViewController {
        let vc = Storyboard.TabBar.instantiate(TabBarViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        MyModuleConnectors.register()
//        LoginModuleConnectors.register()
        
        viewControllers = configViewControllers()
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

// MARK: Config ViewControllers
extension TabBarViewController {
    func configViewControllers() -> [UIViewController] {
        
        let my = MyConnector.instance().connectToOpenURL(Constants.Scheme.my, parameters: nil, completion: nil)!
        let myNavi = BaseNavigationController(rootViewController: my)
        myNavi.tabBarItem.title = "我的"

//        let login = LoginConnector.instance().connectToOpenURL(Constants.Scheme.login, parameters: nil, completion: nil)!
//        let loginNavi = BaseNavigationController(rootViewController: login)
//        loginNavi.tabBarItem.title = "登录"

//        return [myNavi, loginNavi]
        return [myNavi]
    }
}
