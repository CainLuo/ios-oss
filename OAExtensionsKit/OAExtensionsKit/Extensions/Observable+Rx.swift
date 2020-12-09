//
//  Observable+Rx.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import RxSwift
import RxCocoa

extension SharedSequenceConvertibleType {
    public func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

extension ObservableType {
    public func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    public func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}

extension ObservableType {
    public func mapConst<U> (_ value: U) -> Observable<U> {
        return map { _ in value }
    }
}
