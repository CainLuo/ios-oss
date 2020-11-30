//
//  CollectionsViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class CollectionsViewController: BaseViewController {

    static func configureWith() -> CollectionsViewController {
        let vc = Storyboard.Collections.instantiate(CollectionsViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
