//
//  BaseViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

open class BaseViewController: UIViewController {

    public let disposeBag = DisposeBag()

    open override func viewDidLoad() {
        super.viewDidLoad()
        setBackTitleEmpty()
        #if DEBUG
        print("⚠️⚠️⚠️viewDidLoad: \(self.className) ⚠️⚠️⚠️")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("⚠️⚠️⚠️deinit: \(self.className)⚠️⚠️⚠️")
        #endif
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
    public func setBackTitleEmpty() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
