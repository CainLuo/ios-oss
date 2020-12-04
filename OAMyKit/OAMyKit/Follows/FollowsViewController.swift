//
//  FollowsViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class FollowsViewController: BaseViewController {

    static func configureWith() -> FollowsViewController {
        let vc = Storyboard.Follows.instantiate(FollowsViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
