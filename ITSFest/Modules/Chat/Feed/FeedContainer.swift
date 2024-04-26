//
//  FeedContainer.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit

final class FeedContainer {
    let input: FeedModuleInput
    let viewController: UIViewController
    private(set) weak var router: FeedRouterInput!
    
    class func assemble(with context: FeedContext) -> FeedContainer {
        let router = FeedRouter()
        let interactor = FeedInteractor()
        let presenter = FeedPresenter(router: router, interactor: interactor)
        let viewController = FeedViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        return FeedContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: FeedModuleInput, router: FeedRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct FeedContext {
    weak var moduleOutput: FeedModuleOutput?
}
