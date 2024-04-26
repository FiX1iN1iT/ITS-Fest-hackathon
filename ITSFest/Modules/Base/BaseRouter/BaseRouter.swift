//
//  BaseRouter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//

import UIKit

class BaseSwiftRouter: BaseSwiftRouterInput {
    
    weak var view: UIViewController?
    
    func openModuleFromWindow(window: UIWindow?) {
        guard let window = window else { return }
        window.rootViewController = self.view
        window.makeKeyAndVisible()
    }
    
    func openModuleFromViewController(sourseView: UIViewController) {
        self.view?.present(sourseView, animated: true)
    }
    
    func closeModule() {
    }
}
