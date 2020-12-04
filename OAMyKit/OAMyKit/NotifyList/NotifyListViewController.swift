//
//  NotifyListViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import OAGlobalKit
import OAServiceKit

class NotifyListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!

    static func configureWith() -> NotifyListViewController {
        let vc = MyStoryboard.NotifyList.instantiate(NotifyListViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

class NotifyListCell: UITableViewCell {
    
}
