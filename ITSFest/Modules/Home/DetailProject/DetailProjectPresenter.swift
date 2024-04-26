//
//  DetailProjectPresenter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

final class DetailProjectPresenter {
    weak var view: DetailProjectViewInput?
    weak var moduleOutput: DetailProjectModuleOutput?
    
    private let router: DetailProjectRouterInput
    private let interactor: DetailProjectInteractorInput
    
    init(router: DetailProjectRouterInput, interactor: DetailProjectInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension DetailProjectPresenter: DetailProjectModuleInput {
}

extension DetailProjectPresenter: DetailProjectViewOutput {
}

extension DetailProjectPresenter: DetailProjectInteractorOutput {
}
