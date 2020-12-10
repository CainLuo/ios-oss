//
//  MyItemsModel.swift
//  OAMyKit
//
//  Created by YYKJ0048 on 2020/12/9.
//

import ObjectMapper

enum MySectionType {
    case profile
    case commerces
    case personal
    case management
}

struct MySectionModel {
    var type: MySectionType?
    
    // MARK: Profile
    var profile: MyProfileModel?
    
    // MARK: Commerces
    var commerces: MyCommercesModel?
    
    // MARK: Items
    var sectionTitle: String?
    var items: [MyItemModel]?
}

extension MySectionModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        profile <- map["profile"]
        commerces <- map["commerces"]
        sectionTitle <- map["sectionTitle"]
        items <- map["items"]
    }
}

struct MyProfileModel {
    
}

extension MyProfileModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
    }
}

struct MyCommercesModel {
    
}

extension MyCommercesModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
    }
}

struct MyItemModel {
    var title: String?
    var icon: UIImage?
    var moduleURL: URL?
}

extension MyItemModel: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title <- map["title"]
        icon <- map["icon"]
        moduleURL <- map["moduleURL"]
    }
}
