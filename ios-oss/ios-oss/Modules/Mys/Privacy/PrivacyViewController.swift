//
//  PrivacyViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class PrivacyViewController: BaseTableViewController {

    static func configureWith() -> PrivacyViewController {
        let vc = Storyboard.Privacy.instantiate(PrivacyViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
