//
//  RegisterViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import OAServiceKit

class RegisterViewController: BaseViewController {

    static func configureWith() -> RegisterViewController {
        let vc = LoginStoryboard.Register.instantiate(RegisterViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
