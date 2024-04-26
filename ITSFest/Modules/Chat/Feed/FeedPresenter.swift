//
//  FeedPresenter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

final class FeedPresenter {
    weak var view: FeedViewInput?
    weak var moduleOutput: FeedModuleOutput?
    
    private let router: FeedRouterInput
    private let interactor: FeedInteractorInput
    
    init(router: FeedRouterInput, interactor: FeedInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FeedPresenter: FeedModuleInput {
}

extension FeedPresenter: FeedViewOutput {
}

extension FeedPresenter: FeedInteractorOutput {
}
