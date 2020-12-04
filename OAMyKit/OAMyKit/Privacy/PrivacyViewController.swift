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
        
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.showEmtypDataView(options: EmptyDataOptions())
            self?.tableView.reloadData()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [weak self] in
            self?.showEmtypDataView(options: EmptyDataOptions(type:.noNetWork))
            self?.tableView.reloadEmptyDataSet()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) { [weak self] in
            self?.showEmtypDataView(options: EmptyDataOptions(detail: "自定义",imageName: "no_data_list", type:.custom))
            self?.tableView.reloadData()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) { [weak self] in
            self?.hideEmtypDataView()
            self?.tableView.reloadData()
        }
    }
}


