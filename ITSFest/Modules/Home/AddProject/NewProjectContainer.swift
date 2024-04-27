//
//  NewProjectContainer.swift
//  ITSFest
//
//  Created by Grigory Don on 27.04.2024.
//  
//

import UIKit

final class NewProjectContainer {
    let input: NewProjectModuleInput
    let viewController: UIViewController
    private(set) weak var router: NewProjectRouterInput!
    
    class func assemble(with context: NewProjectContext) -> NewProjectContainer {
        let router = NewProjectRouter()
        let interactor = NewProjectInteractor()
        let presenter = NewProjectPresenter(router: router, interactor: interactor)
        let viewController = NewProjectViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        return NewProjectContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: NewProjectModuleInput, router: NewProjectRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct NewProjectContext {
    weak var moduleOutput: NewProjectModuleOutput?
}
