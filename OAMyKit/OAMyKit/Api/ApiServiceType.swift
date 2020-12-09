//
//  ApiServiceType.swift
//  ios-oss
//
//  Created by YYKJ0048 on 2020/11/24.
//

import Alamofire
import Moya
import RxSwift

protocol ApiServiceType {
    func profile() -> Single<CodeResponse>
}
