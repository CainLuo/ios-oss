//
//  UIViewController+EmptyData.swift
//  ios-oss
//
//  Created by YYKJ0046 on 2020/12/4.
//

import UIKit
import DZNEmptyDataSet

public extension UIScrollView {
    weak var emptyDataDelegate: EmptyDataDelegate? {
        get {
            return (objc_getAssociatedObject(self, &kEmptyDataDelegateKey) as? EmptyDataDelegate)
        }
        set(newValue) {
            self.emptyDataSetSource = newValue
            self.emptyDataSetDelegate = newValue
            objc_setAssociatedObject(self, &kEmptyDataDelegateKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}

public protocol EmptyDataDelegate: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    func showEmtypDataView()
    func showEmtypDataView(options: EmptyDataOptions)
    func hideEmtypDataView()
}

public enum EmptyDataType {
    case noData
    case noNetWork
    case searchFail
    case custom
}

public struct EmptyDataOptions {
    var title: String
    var detail: String
    var imageName: String
    var type: EmptyDataType
    public init(title: String = "", detail: String = "", imageName: String = "placeholder_search", type: EmptyDataType = .noData) {
        self.title = title
        self.detail = detail
        self.type = type
        self.imageName = imageName

        switch type {
        case .noData:
            self.detail = "没有数据"
        case .noNetWork:
            self.detail = "请检查网络"
        case .searchFail:
            self.detail = "搜索为空"
        case .custom:
            self.title = title
            self.detail = detail
            self.imageName = imageName
        }
    }
}

private var kCanShowEmptyDataKey: Bool = false
private var kEmptyDataOptionKey: EmptyDataOptions = EmptyDataOptions()
private weak var kEmptyDataDelegateKey: EmptyDataDelegate?

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
        
    }
}

extension UIViewController : EmptyDataDelegate {
    open func showEmtypDataView() {
        showEmtypDataView(options: EmptyDataOptions())
    }
    
    open func showEmtypDataView(options: EmptyDataOptions) {
        canShowEmptyData = true
        emptyDataOption = options
    }
    
    open func hideEmtypDataView() {
        canShowEmptyData = false
    }
}
