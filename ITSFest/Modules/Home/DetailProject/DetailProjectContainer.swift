//
//  DetailProjectContainer.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit

final class DetailProjectContainer {
    let input: DetailProjectModuleInput
    let viewController: UIViewController
    private(set) weak var router: DetailProjectRouterInput!
    
    class func assemble(with context: DetailProjectContext) -> DetailProjectContainer {
        let router = DetailProjectRouter()
        let interactor = DetailProjectInteractor()
        let presenter = DetailProjectPresenter(router: router, interactor: interactor)
        let viewController = DetailProjectViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        return DetailProjectContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: DetailProjectModuleInput, router: DetailProjectRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct DetailProjectContext {
    weak var moduleOutput: DetailProjectModuleOutput?
}
