//
//  ReplyContainer.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit

final class ReplyContainer {
    let input: ReplyModuleInput
    let viewController: UIViewController
    private(set) weak var router: ReplyRouterInput!
    
    class func assemble(with context: ReplyContext) -> ReplyContainer {
        let router = ReplyRouter()
        let interactor = ReplyInteractor()
        let presenter = ReplyPresenter(router: router, interactor: interactor)
        let viewController = ReplyViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        return ReplyContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: ReplyModuleInput, router: ReplyRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct ReplyContext {
    weak var moduleOutput: ReplyModuleOutput?
}
