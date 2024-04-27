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
    
    func openModuleFromViewController(sourceView: UIViewController?, openView: UIViewController, needHavController: Bool) {
        
        guard needHavController == true else {
            openView.modalPresentationStyle = .fullScreen
            sourceView?.present(openView, animated: true)
            return
        }
        
        sourceView?.navigationController?.pushViewController(openView, animated: true)
        
    }
    
    func closeModule() {
    }
}
