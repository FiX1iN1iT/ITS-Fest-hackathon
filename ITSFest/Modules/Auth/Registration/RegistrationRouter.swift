//
//  RegistrationRouter.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//  
//

import UIKit

final class RegistrationRouter: BaseSwiftRouter {
}

extension RegistrationRouter: RegistrationRouterInput {
    func openLogin() {
        openModuleFromViewController(sourceView: self.view, openView: AuthContainer.assemble().viewController, needHavController: false)
    }
    
    func openHome() {
        // TODO: - 
    }
}
