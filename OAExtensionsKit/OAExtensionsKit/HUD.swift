//
//  HUD.swift
//  OAExtensionsKit
//
//  Created by CainLuo on 2020/12/5.
//

import UIKit
import RxSwift
import RxCocoa
import MBProgressHUD

public class HUD: NSObject {
    
    @objc public static func instantiate() -> HUD {
        return HUD()
    }
    
    @objc public var isLoading: Bool = false {
        didSet {
            isLoading ? HUD.loading(isSubmit: false) : HUD.dismiss()
        }
    }
    
    @objc public var isSubmitting: Bool = false {
        didSet {
            isSubmitting ? HUD.loading(isSubmit: true) : HUD.dismiss()
        }
    }
    
    @objc public static func show(_ message: String, delay: TimeInterval = 1.5) {
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
    
    @objc public static func show(_ message: String? = nil, view: UIView? = nil, delay: TimeInterval = 1.5) {
        DispatchQueue.main.async {
            let hud = self.hud(view)
            hud?.detailsLabel.font = UIFont.fitFont(13)
            hud?.detailsLabel.text = message
            hud?.mode = (view == nil) ? .text : .customView
            hud?.isUserInteractionEnabled = false
            hud?.hide(animated: true, afterDelay: delay)
        }
    }
    
    @objc public static func loading(_ message: String? = nil, isSubmit: Bool = true) {
        DispatchQueue.main.async {
            let hud = self.windowHud()
            hud?.mode = .indeterminate
            hud?.isUserInteractionEnabled = isSubmit
            hud?.label.text = message
            hud?.label.font = UIFont.fitFont(13)
        }
    }
    
    @objc public static func loading(_ message: String? = nil, view: UIView? = nil, isSubmit: Bool = false) {
        DispatchQueue.main.async {
            let hud = self.hud(view)
            hud?.mode = .indeterminate
            hud?.isUserInteractionEnabled = isSubmit
            hud?.label.text = message
            hud?.label.font = UIFont.fitFont(13)
        }
    }
        
    @objc public static func dismiss(_ view: UIView? = nil) {
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
public extension Reactive where Base: HUD {
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
