//
//  CommentsViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import OAGlobalKit
import OAServiceKit

class CommentsViewController: BaseViewController {

    static func configureWith() -> CommentsViewController {
        let vc = MyStoryboard.Comments.instantiate(CommentsViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
