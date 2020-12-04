//
//  UIViewController+EmptyData.swift
//  ios-oss
//
//  Created by YYKJ0046 on 2020/12/4.
//

import UIKit
import DZNEmptyDataSet

protocol EmptyDataDelegate {
    func showEmtypDataView(options: EmptyDataOptions)
    func hideEmtypDataView()
}

enum EmptyDataType {
    case noData
    case noNetWork
    case searchFail
    case custom
}

struct EmptyDataOptions {
    var title: String
    var detail: String
    var imageName: String
    var type: EmptyDataType
    init(title: String = "", detail: String = "", imageName: String = "placeholder_search", type: EmptyDataType = .noData) {
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

extension UIViewController {
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

    public func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "")
    }

    public func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return  NSAttributedString(string: emptyDataOption?.detail ?? "")
    }

    public func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: emptyDataOption?.imageName ?? "")
    }

    public func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return .clear
    }

    public func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        let top = scrollView.contentInset.top
        return top - 44 // FIXME: Magical number (Tab Bar Height)
    }
}

extension UIViewController: DZNEmptyDataSetDelegate {

    public func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return self.canShowEmptyData ?? false
    }

    public func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
        return true
    }

    public func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
  
    }
}

extension UIViewController : EmptyDataDelegate {
    func showEmtypDataView(options: EmptyDataOptions) {
        canShowEmptyData = true
        emptyDataOption = options
    }
    
    func hideEmtypDataView() {
        canShowEmptyData = false
    }
}
