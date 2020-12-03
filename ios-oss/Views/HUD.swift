//
//  HUD.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import MBProgressHUD

class HUD: NSObject {
    
    @objc static func instantiate() -> HUD {
        return HUD()
    }
    
    @objc var isLoading: Bool = false {
        didSet {
            isLoading ? HUD.loading(isSubmit: false) : HUD.dismiss()
        }
    }
    
    @objc var isSubmitting: Bool = false {
        didSet {
            isSubmitting ? HUD.loading(isSubmit: true) : HUD.dismiss()
        }
    }
    
    @objc static func show(_ message: String, delay: TimeInterval = 1.5) {
        guard message.count > 0 else { return }
        DispatchQueue.main.async {
            let hud = self.windowHud()
            hud?.detailsLabel.font = UIFont.fitFont(13)
            hud?.detailsLabel.text = message
            hud?.mode = .text
            hud?.isUserInteractionEnabled = false
            hud?.hide(animated: true, afterDelay: delay)
        }
    }
    
    @objc static func show(_ message: String? = nil, view: UIView? = nil, delay: TimeInterval = 1.5) {
        DispatchQueue.main.async {
            let hud = self.hud(view)
            hud?.detailsLabel.font = UIFont.fitFont(13)
            hud?.detailsLabel.text = message
            hud?.mode = (view == nil) ? .text : .customView
            hud?.isUserInteractionEnabled = false
            hud?.hide(animated: true, afterDelay: delay)
        }
    }
    
    @objc static func loading(_ message: String? = nil, isSubmit: Bool = true) {
        DispatchQueue.main.async {
            let hud = self.windowHud()
            hud?.mode = .indeterminate
            hud?.isUserInteractionEnabled = isSubmit
            hud?.label.text = message
            hud?.label.font = UIFont.fitFont(13)
        }
    }
    
    @objc static func loading(_ message: String? = nil, view: UIView? = nil, isSubmit: Bool = false) {
        DispatchQueue.main.async {
            let hud = self.hud(view)
            hud?.mode = .indeterminate
            hud?.isUserInteractionEnabled = isSubmit
            hud?.label.text = message
            hud?.label.font = UIFont.fitFont(13)
        }
    }
        
    @objc static func dismiss(_ view: UIView? = nil) {
        DispatchQueue.main.async {
            if let view = view {
                MBProgressHUD.hide(for: view, animated: true)
                return
            }
            UIApplication.shared.keyWindow?.subviews.forEach({ view in
                if view.isKind(of: MBProgressHUD.self), let hud = view as? MBProgressHUD {
                    if hud.mode == .indeterminate {
                        hud.hide(animated: true)
                    }
                }
            })
        }
    }
    
    private static func hud(_ view: UIView?) -> MBProgressHUD? {
        guard let view = view else { return nil}
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = .black
        hud.contentColor = .white
        hud.removeFromSuperViewOnHide = true
        return hud
    }
    
    private static func windowHud() -> MBProgressHUD? {
        guard let keyWindow = UIApplication.shared.keyWindow else { return nil}
        let hud = MBProgressHUD.showAdded(to: keyWindow, animated: true)
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = .black
        hud.contentColor = .white
        hud.removeFromSuperViewOnHide = true
        return hud
    }
}

// RxSwift Vresion
extension Reactive where Base: HUD {
    var isLoading: Binder<Bool> {
        return Binder(self.base) { view, isLoading in
            view.isLoading = isLoading
        }
    }
    
    var isSubmitting: Binder<Bool> {
        return Binder(self.base) { view, isSubmitting in
            view.isSubmitting = isSubmitting
        }
    }
}
