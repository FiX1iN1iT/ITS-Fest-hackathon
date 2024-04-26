//
//  CalendarPresenter.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//  
//

import Foundation

final class CalendarPresenter {
    weak var view: CalendarViewInput?
    weak var moduleOutput: CalendarModuleOutput?
    
    private let router: CalendarRouterInput
    private let interactor: CalendarInteractorInput
    
    init(router: CalendarRouterInput, interactor: CalendarInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CalendarPresenter: CalendarModuleInput {
}

extension CalendarPresenter: CalendarViewOutput {
    func didLoadView() {
        print(#function)
    }
}

extension CalendarPresenter: CalendarInteractorOutput {
    func didLoadDay(with tasks: [String]) {
        print(#function)
    }
    
    func didStartLoading() {
        print(#function)
    }
    
    func didEndLoading() {
        print(#function)
    }
}
