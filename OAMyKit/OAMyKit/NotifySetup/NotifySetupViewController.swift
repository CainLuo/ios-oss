//
//  NotifySetupViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import OAGlobalKit
import OAServiceKit

class NotifySetupViewController: BaseViewController {

    static func configureWith() -> NotifySetupViewController {
        let vc = MyStoryboard.NotifySetup.instantiate(NotifySetupViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
