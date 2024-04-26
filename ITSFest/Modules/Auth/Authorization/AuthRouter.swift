//
//  AuthRouter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit

final class AuthRouter: BaseSwiftRouter {
}

extension AuthRouter: AuthRouterInput {
    
    func openRegistration() {
        let container = RegistrationContainer.assemble(with: RegistrationContext())
        print("asas")
        openModuleFromViewController(sourseView: container.viewController)
    }
}
