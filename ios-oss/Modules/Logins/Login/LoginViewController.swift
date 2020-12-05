//
//  LoginViewController.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import OAExtensionsKit

class LoginViewController: BaseViewController {
    
    private let viewModel: LoginViewModelTypes = LoginViewModel()
    private let loadingView = HUD.instantiate()

    static func configureWith() -> UIViewController {
        let vc = Storyboard.Login.instantiateRoot()
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        rx.viewWillAppear.mapToVoid()
            .bind(to: viewModel.inputs.viewWillAppear)
            .disposed(by: disposeBag)
        
        viewModel.outputs.error
            .drive(onNext: { error in
                HUD.show(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.isLoading
            .drive(loadingView.rx.isLoading)
            .disposed(by: disposeBag)
        
        viewModel.outputs.loadSuccess
            .drive(onNext: { message in
                HUD.show(message)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func login(_ sender: Any) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.login()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
