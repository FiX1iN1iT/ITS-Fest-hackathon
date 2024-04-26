//
//  ChatPresenter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

final class ChatPresenter {
    weak var view: ChatViewInput?
    weak var moduleOutput: ChatModuleOutput?
    
    private let router: ChatRouterInput
    private let interactor: ChatInteractorInput
    
    init(router: ChatRouterInput, interactor: ChatInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ChatPresenter: ChatModuleInput {
}

extension ChatPresenter: ChatViewOutput {
}

extension ChatPresenter: ChatInteractorOutput {
}
