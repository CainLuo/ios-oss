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
        self.title = "隐私"
        self.hbd_barTintColor = UIColor.red
        self.hbd_tintColor = UIColor.white
        self.hbd_titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
