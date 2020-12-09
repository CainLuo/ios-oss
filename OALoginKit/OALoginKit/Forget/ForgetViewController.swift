//
//  ForgetViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import OAServiceKit

class ForgetViewController: BaseViewController {

    static func configureWith() -> ForgetViewController {
        let vc = LoginStoryboard.Forget.instantiate(ForgetViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
