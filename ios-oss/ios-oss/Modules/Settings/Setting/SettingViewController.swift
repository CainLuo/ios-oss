//
//  SettingViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import Localize_Swift
import RxSwift
import RxCocoa

class SettingViewController: BaseViewController {
    @IBOutlet weak var label: UILabel!
    
    var actionSheet: UIAlertController!
    
    let availableLanguages = Localize.availableLanguages()
    
    static func configureWith() -> SettingViewController {
        let vc = Storyboard.Setting.instantiate(SettingViewController.self)
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "A".localized()
        
        NotificationCenter.default.rx
            .notification(NSNotification.Name(LCLLanguageChangeNotification))
            .subscribe(onNext: { [weak self] _ in
                DispatchQueue.main.async {
                    self?.label.text = "A".localized()
                }
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func logout(_ sender: Any) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.logout()
        }
    }
    
    @IBAction func zhAction(_ sender: Any) {
        actionSheet = UIAlertController(title: nil, message: "Switch Language", preferredStyle: UIAlertController.Style.actionSheet)
        for language in availableLanguages {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                print("languagelanguagelanguagelanguagelanguagelanguagelanguage: \(language)")
                    Localize.setCurrentLanguage(language)
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func enAction(_ sender: Any) {
        Localize.setCurrentLanguage("en")
    }
}
