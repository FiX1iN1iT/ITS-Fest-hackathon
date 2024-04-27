//
//  BaseRouter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//

import UIKit

class BaseSwiftRouter: BaseSwiftRouterInput {
    
    weak var view: UIViewController?
    
    func openModuleFromWindow(window: UIWindow?, navigationController: UINavigationController?) {
        guard let window = window else { return }
        guard let navigationController = navigationController else {
            window.rootViewController = self.view
            window.makeKeyAndVisible()
            return
        }
        
        #warning("Поправить")
        navigationController.pushViewController(self.view!, animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func openModuleFromViewController(sourseView: UIViewController?, openView: UIViewController) {
        print(#function)
        sourseView?.navigationController?.pushViewController(openView, animated: true)
    }
    
    func closeModule() {
    }
}
