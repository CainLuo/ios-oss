//
//  NicheViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class NicheViewController: BaseViewController {

    static func configureWith() -> NicheViewController {
        let vc = Storyboard.Niche.instantiate(NicheViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
