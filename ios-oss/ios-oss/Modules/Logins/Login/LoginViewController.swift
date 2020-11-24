//
//  LoginViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

class LoginViewController: BaseViewController {

    static func configureWith() -> UIViewController {
        let vc = Storyboard.Login.instantiateRoot()
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.login()
        }
    }
}
