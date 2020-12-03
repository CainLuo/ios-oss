//
//  QRCodeViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class QRCodeViewController: BaseViewController {

    static func configureWith() -> QRCodeViewController {
        let vc = Storyboard.QRCode.instantiate(QRCodeViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
