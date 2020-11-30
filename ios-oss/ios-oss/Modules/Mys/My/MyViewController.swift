//
//  MyViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit

class MyViewController: BaseTableViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var accreditation: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func logout(_ sender: Any) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.logout()
        }
    }
    
    @IBAction func qrCodeAction(_ sender: Any) {
        
    }
}
