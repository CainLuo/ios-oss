//
//  GeneralController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class GeneralController: BaseTableViewController {

    static func configureWith() -> GeneralController {
        let vc = Storyboard.General.instantiate(GeneralController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
