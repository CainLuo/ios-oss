//
//  CodeResponse.swift
//  Litalk
//
//  Created by YYKJ0048 on 2020/4/26.
//  Copyright © 2020 ve2. All rights reserved.
//

import Foundation
import ObjectMapper

struct CodeResponse {
    var code: MyConstants.ErrorCode = .unknown
}

extension CodeResponse: Mappable {
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
    }
}
