//
//  AboutViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import Localize_Swift
import OAGlobalKit

class AboutViewController: BaseViewController {
    
    static func configureWith() -> AboutViewController {
        let vc = Storyboard.About.instantiate(AboutViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if Localize.currentLanguage() == "zh-Hans" {
            Localize.setCurrentLanguage("en")
        } else {
            Localize.setCurrentLanguage(Localize.availableLanguages().first!)
        }
        
        log.debug(Localize.availableLanguages())
    }
}
