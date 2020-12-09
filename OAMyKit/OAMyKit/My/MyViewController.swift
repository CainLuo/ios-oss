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
import OAExtensionsKit
import SwifterSwift

public class MyViewController: BaseViewController {
    
    public static func configureWith() -> UIViewController? {
        return MyStoryboard.My.instantiate(MyViewController.self)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel: MyViewModelTypes = MyViewModel()
    private var dataSource: [MySectionModel] = []

    public override func viewDidLoad() {
        super.viewDidLoad()
        hbd_barShadowHidden = true
        hbd_barTintColor = .white
        hbd_tintColor = UIColor(hex: 0x333333)
    }
                
    public override func bindViewModel() {
        rx.viewWillAppear.mapToVoid()
            .bind(to: viewModel.inputs.viewWillAppear)
            .disposed(by: disposeBag)

        viewModel.outputs.title
            .drive(rx.title)
            .disposed(by: disposeBag)

        viewModel.outputs.error
            .drive(onNext: { error in
                HUD.show(error.localizedDescription)
                log.debug(error)
            })
            .disposed(by: disposeBag)
        
        viewModel.outputs.sections
            .drive(onNext: { [weak self] sections in
                self?.dataSource = sections
                self?.collectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        collectionView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)

        collectionView.rx
            .setDataSource(self)
            .disposed(by: disposeBag)

//        viewModel.outputs.isLoading
//            .drive(loadingView.rx.isLoading)
//            .disposed(by: disposeBag)
    }
}

// MARK: UICollectionViewDelegate
extension MyViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: UICollectionViewDataSource
extension MyViewController: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let model = dataSource[section]
        switch model.type {
        case .personal,
             .management:
            return model.items?.count ?? 0
        default:
            return 1
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = dataSource[indexPath.section]
        switch model.type {
        case .profile:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyProfileCell", for: indexPath) as! MyProfileCell
            return cell
        case .commerces:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCommercesCell", for: indexPath) as! MyCommercesCell
            return cell
        case .personal,
             .management:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyItemCell", for: indexPath) as! MyItemCell
            if let item = model.items?[indexPath.row] {
                cell.item = item
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let resuableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MySectionView", for: indexPath) as! MySectionView
            let model = dataSource[indexPath.section]
            resuableView.titleLabel.text = model.sectionTitle
            return resuableView
        }
        
        let resuableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MyFooterView", for: indexPath)
        resuableView.backgroundColor = UIColor(hex: 0xf5f5f5)
        return resuableView
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MyViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let model = dataSource[section]
        switch model.type {
        case .personal,
             .management:
            return CGSize(width: UIScreen.main.width, height: 44)
        default:
            return .zero
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return (dataSource[section].type == .management) ? .zero : CGSize(width: UIScreen.main.width, height: 10)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = dataSource[indexPath.section]
        log.debug(model)
        switch model.type {
        case .profile:
            return CGSize(width: UIScreen.main.bounds.size.width, height: 100)
        case .commerces:
            return CGSize(width: UIScreen.main.bounds.size.width, height: 44)
        case .personal,
             .management:
            return CGSize(width: floor(UIScreen.main.bounds.size.width / 4), height: floor(UIScreen.main.bounds.size.width / 4))
        default:
            return .zero
        }
    }
}
