//
//  BaseViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackTitleEmpty()
        log.debug(self.className)
    }
    
    deinit {
        log.debug(self.className)
    }
}

// MARK: Class Name
extension NSObject {
    public class var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}

extension UIViewController {
    func setBackTitleEmpty() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
