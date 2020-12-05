//
//  MyViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import Localize_Swift
import HBDNavigationBar
import OAServiceKit
import OAGlobalKit

public class MyViewController: BaseTableViewController {
    
    public static func configureWith() -> UIViewController? {
        return MyStoryboard.My.instantiate(MyViewController.self)
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var certifiedLabel: UILabel!
    @IBOutlet weak var qrCodeButton: UIButton!
    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var notifyListLabel: UILabel!
    @IBOutlet weak var nicheLabel: UILabel!
    @IBOutlet weak var notifySetupLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var generalLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!

    private let viewModel: MyViewModelTypes = MyViewModel()

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.hbd_barHidden = true
    }
                
    public override func bindViewModel() {
        rx.viewWillAppear.mapToVoid()
            .bind(to: viewModel.inputs.viewWillAppear)
            .disposed(by: disposeBag)

        viewModel.outputs.title
            .drive(self.rx.title)
            .disposed(by: disposeBag)

        viewModel.outputs.certifiedTitle
            .drive(certifiedLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.qrCodeTitle
            .drive(qrCodeButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        viewModel.outputs.collectionTitle
            .drive(collectionButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        viewModel.outputs.followTitle
            .drive(followButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        viewModel.outputs.commentTitle
            .drive(commentButton.rx.title(for: .normal))
            .disposed(by: disposeBag)

        viewModel.outputs.notifyListTitle
            .drive(notifyListLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.nicheTitle
            .drive(nicheLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.notifySetupTitle
            .drive(notifySetupLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.privacyTitle
            .drive(privacyLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.generalTitle
            .drive(generalLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.aboutTitle
            .drive(aboutLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.feedbackTitle
            .drive(feedbackLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.outputs.logoutTitle
            .drive(logoutButton.rx.title(for: .normal))
            .disposed(by: disposeBag)
        
        viewModel.outputs.error
            .drive(onNext: { error in
//                HUD.show(error.localizedDescription)
                log.debug(error)
            })
            .disposed(by: disposeBag)
        
//        viewModel.outputs.isLoading
//            .drive(loadingView.rx.isLoading)
//            .disposed(by: disposeBag)
    }
    
    @IBAction func logout(_ sender: Any) {
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            appDelegate.logout()
//        }
    }
    
    @IBAction func qrCodeAction(_ sender: Any) {
    }
    
    @IBAction func collectionAction(_ sender: Any) {
    }
    
    @IBAction func followAction(_ sender: Any) {
    }
    
    @IBAction func commentAction(_ sender: Any) {
    }
}
