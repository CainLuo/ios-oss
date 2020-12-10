//
//  PersonalViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import OAGlobalKit
import OAServiceKit

class PersonalViewController: BaseViewController {

    static func configureWith() -> PersonalViewController {
        let vc = MyStoryboard.Personal.instantiate(PersonalViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
