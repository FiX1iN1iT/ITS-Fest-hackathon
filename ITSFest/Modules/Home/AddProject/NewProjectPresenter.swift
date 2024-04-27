//
//  NewProjectPresenter.swift
//  ITSFest
//
//  Created by Grigory Don on 27.04.2024.
//  
//

import Foundation

final class NewProjectPresenter {
    weak var view: NewProjectViewInput?
    weak var moduleOutput: NewProjectModuleOutput?
    
    private let router: NewProjectRouterInput
    private let interactor: NewProjectInteractorInput
    
    init(router: NewProjectRouterInput, interactor: NewProjectInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension NewProjectPresenter: NewProjectModuleInput {
}

extension NewProjectPresenter: NewProjectViewOutput {
}

extension NewProjectPresenter: NewProjectInteractorOutput {
}
