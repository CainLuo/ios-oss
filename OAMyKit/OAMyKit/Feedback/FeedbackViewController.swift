//
//  FeedbackViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit

class FeedbackViewController: BaseViewController {

    static func configureWith() -> FeedbackViewController {
        let vc = Storyboard.Feedback.instantiate(FeedbackViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
