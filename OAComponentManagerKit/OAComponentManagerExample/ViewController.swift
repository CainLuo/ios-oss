//
//  ViewController.swift
//  OAComponentManagerExample
//
//  Created by YYKJ0048 on 2020/12/4.
//

import UIKit
import OAComponentManagerKit

class ViewController: UIViewController {

    static func configureWith() -> ViewController {
        let vc = Storyboard.Main.instantiate(ViewController.self)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushToModuleA(_ sender: Any) {
        _ = ComponentManager.routeURL(ModuleRouter.moduleA,
                                      parameters: [routerModeKey: NavigatorType.present],
                                      completion: { info in
            print("done: -------------------------------------:\(info)")
        })
        
//        let prt = ComponentManager.serviceForProtocol(ModuleAServiceProtocol.self) as? ModuleAConnector
//        prt?.show("gagga", cancel: { info in
//            print("cancel: -------------------------------------:\(info)")
//        }, done: { info in
//            print("done: -------------------------------------:\(info)")
//        })
    }
}

enum ModuleRouter {
    static let moduleA = URL(string: "productScheme://ModuleA")!
}
