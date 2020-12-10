//
//  FindPasswordViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import OAServiceKit

class FindPasswordViewController: BaseViewController {

    static func configureWith() -> FindPasswordViewController {
        let vc = LoginStoryboard.FindPassword.instantiate(FindPasswordViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
