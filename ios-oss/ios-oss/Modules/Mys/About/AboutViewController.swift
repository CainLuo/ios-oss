//
//  AboutViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class AboutViewController: BaseViewController {
    
    static func configureWith() -> AboutViewController {
        let vc = Storyboard.About.instantiate(AboutViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        log.debug(navigationItem.backBarButtonItem)
    }
}
