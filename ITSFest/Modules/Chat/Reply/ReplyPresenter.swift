//
//  ReplyPresenter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

final class ReplyPresenter {
    weak var view: ReplyViewInput?
    weak var moduleOutput: ReplyModuleOutput?
    
    private let router: ReplyRouterInput
    private let interactor: ReplyInteractorInput
    
    init(router: ReplyRouterInput, interactor: ReplyInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ReplyPresenter: ReplyModuleInput {
}

extension ReplyPresenter: ReplyViewOutput {
}

extension ReplyPresenter: ReplyInteractorOutput {
}
