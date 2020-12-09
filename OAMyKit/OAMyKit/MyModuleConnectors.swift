//
//  MyModuleConnectors.swift
//  OAMyKit
//
//  Created by CainLuo on 2020/12/5.
//

import Foundation

public class MyModuleConnectors {
    
    public static func register() {
        AboutConnector.instance().register()
        CollectionsConnector.instance().register()
        FeedbackConnector.instance().register()
        FeedbackConnector.instance().register()
        FollowsConnector.instance().register()
        GeneralConnector.instance().register()
        MyConnector.instance().register()
        NicheConnector.instance().register()
        NotifyListConnector.instance().register()
        NotifySetupConnector.instance().register()
        PersonalConnector.instance().register()
        PrivacyConnector.instance().register()
        QRCodeConnector.instance().register()
    }
}
