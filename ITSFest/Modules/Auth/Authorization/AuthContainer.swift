//
//  AuthContainer.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit

final class AuthContainer { // DI - контрукторный тип
    let input: AuthModuleInput
    let viewController: UIViewController
    private(set) weak var router: AuthRouterInput!
    
    class func assemble() -> AuthContainer {
        let router = AuthRouter()
        let interactor = AuthInteractor()
        let presenter = AuthPresenter(router: router, interactor: interactor)
        let viewController = AuthViewController(output: presenter)
        
        presenter.view = viewController
        
        interactor.output = presenter
        
        router.view = viewController
        
        return AuthContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: AuthModuleInput, router: AuthRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}
