//
//  TaskContainer.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation

import UIKit

final class TaskAssembler {
    static func assemble() -> UIViewController {
        let router = ProfileRouter()
        let interactor = TaskInteractor()
        let presenter = TaskPresenter(router: router, interactor: interactor)
        let viewController = TaskViewController(output: presenter)
        
        presenter.view = viewController
        router.viewController = viewController
        interactor.output = presenter

        return viewController
    }
}
