//
//  UIViewController+EmptyData.swift
//  ios-oss
//
//  Created by YYKJ0046 on 2020/12/4.
//

import UIKit
import DZNEmptyDataSet

/// 交换Key
private var kCanShowEmptyDataKey: Bool = false
private var kEmptyDataOptionKey: EmptyDataOptions = EmptyDataOptions()
private weak var kEmptyDataRendererKey: EmptyDataRenderer?
private var kEmptyDataDelegateKey: EmptyDataDelegate?

/// 默认实现的协议
public protocol EmptyDataRenderer: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    func showEmytpDataView()
    func showEmptyDataView(options: EmptyDataOptions)
    func hideEmptyDataView()
}

/// 为外部提供事件回调
@objc public protocol EmptyDataDelegate: NSObjectProtocol {
    @objc optional func clickEmptyDataView()
}

public extension UIScrollView {
    weak var emptyDataRenderer: EmptyDataRenderer? {
        get {
            return (objc_getAssociatedObject(self, &kEmptyDataRendererKey) as? EmptyDataRenderer)
        }
        set(newValue) {
            self.emptyDataSetSource = newValue
            self.emptyDataSetDelegate = newValue
            objc_setAssociatedObject(self, &kEmptyDataRendererKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}

/// 空数据显示的类型
public enum EmptyDataType {
    case noData
    case noNetWork
    case searchFail
    case custom
}

/// 显示用的值
public struct EmptyDataOptions {
    private var _type : EmptyDataType = .noData
    
    var title: String
    var detail: String
    var imageName: String
    var isAuto: Bool
    var type: EmptyDataType {
        get { return _type }
        set {
            _type = newValue
            switch self.type {
            case .noData:
                detail = "没有数据"
                imageName = "placeholder_search"
            case .noNetWork:
                detail = "请检查网络"
                imageName = "placeholder_search"
            case .searchFail:
                detail = "搜索为空"
                imageName = "placeholder_search"
            case .custom:
                break
            }
        }
    }
    
    public init(title: String = "", detail: String = "", imageName: String = "placeholder_search", type: EmptyDataType = .noData, isAuto: Bool = true) {
        self.isAuto = isAuto
        if type != .noData {
            self.isAuto = false
        }
        self.title = title
        self.detail = detail
        self.imageName = imageName
        self.type = type
    }
}

public extension UIViewController {
    var canShowEmptyData: Bool? {
        get {
            return (objc_getAssociatedObject(self, &kCanShowEmptyDataKey) as? Bool)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kCanShowEmptyDataKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var emptyDataOption: EmptyDataOptions? {
        get {
            return (objc_getAssociatedObject(self, &kEmptyDataOptionKey) as? EmptyDataOptions)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kEmptyDataOptionKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var emptyDataDelegate: EmptyDataDelegate? {
        get {
            return (objc_getAssociatedObject(self, &kEmptyDataDelegateKey) as? EmptyDataDelegate)
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kEmptyDataDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}

extension UIViewController: DZNEmptyDataSetSource {

    open func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "")
    }

    open func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return  NSAttributedString(string: emptyDataOption?.detail ?? "")
    }

    open func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: emptyDataOption?.imageName ?? "")
    }

    open func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return .clear
    }

    open func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        let top = scrollView.contentInset.top
        return top - 44 // FIXME: Magical number (Tab Bar Height)
    }
}

extension UIViewController: DZNEmptyDataSetDelegate {

    open func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return self.canShowEmptyData ?? false
    }

    open func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    open func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
        return true
    }

    open func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        
    }
    
    open func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        if let delegate = emptyDataDelegate, delegate.responds(to: #selector(EmptyDataDelegate.clickEmptyDataView)){
            emptyDataDelegate?.clickEmptyDataView?()
        }
    }
    
    public func emptyDataSetWillAppear(_ scrollView: UIScrollView!) {
        if isNoNetWork() {
            if let option = emptyDataOption, option.isAuto{
                emptyDataOption?.type = .noNetWork
            }
        }else {
            if let option = emptyDataOption, option.isAuto {
                emptyDataOption?.type = .noData
            }
        }
    }
}

/// 默认实现
extension UIViewController : EmptyDataRenderer {
    open func showEmytpDataView() {
        showEmptyDataView(options: EmptyDataOptions())
    }
    
    open func showEmptyDataView(options: EmptyDataOptions) {
        canShowEmptyData = true
        emptyDataOption = options
    }
    
    open func hideEmptyDataView() {
        canShowEmptyData = false
    }
}

extension UIViewController {
    
    /// 判断网络状态
    /// - Returns: Bool
    private func isNoNetWork() -> Bool {
        return false
    }
}

