//
//  AboutViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/30.
//

import UIKit
import Localize_Swift
import OAGlobalKit
import OAServiceKit

public class AboutViewController: BaseViewController {
    
    public static func configureWith() -> AboutViewController? {
        return MyStoryboard.About.instantiate(AboutViewController.self)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        if Localize.currentLanguage() == "zh-Hans" {
            Localize.setCurrentLanguage("en")
        } else {
            Localize.setCurrentLanguage(Localize.availableLanguages().first!)
        }
        
        log.debug(Localize.availableLanguages())
    }
}
