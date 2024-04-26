//
//  CalendarContainer.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//  
//

import UIKit

final class CalendarContainer {
    let input: CalendarModuleInput
    let viewController: UIViewController
    private(set) weak var router: CalendarRouterInput!
    
    class func assemble(with context: CalendarContext) -> CalendarContainer {
        let router = CalendarRouter()
        let interactor = CalendarInteractor()
        let presenter = CalendarPresenter(router: router, interactor: interactor)
        let viewController = CalendarViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        interactor.taskService = context.taskService
        
        return CalendarContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: CalendarModuleInput, router: CalendarRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct CalendarContext {
    weak var moduleOutput: CalendarModuleOutput?
    let taskService: TaskServiceDescription = TaskService()
}
