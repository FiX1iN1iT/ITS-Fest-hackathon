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
    
    private var tasks: [Task] = []
    
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
        interactor.loadDay(Date())
    }
    
    func didTapDay(_ date: Date) {
        print(#function)
        interactor.loadDay(date)
    }
    
    func numberOfSections() -> Int {
        tasks.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        Constants.numberOfRowsInSection
    }
    
    func getTask(at index: Int) -> Task {
        tasks[index]
    }
}

extension CalendarPresenter: CalendarInteractorOutput {
    func didLoadDay(with tasks: [Task]) {
        self.tasks = tasks
        view?.reloadData()
        
        if !tasks.isEmpty {
            view?.dismissEmptyStateView()
        } else {
            view?.showEmptyStateView()
        }
    }
    
    func didStartLoading() {
        view?.showLoadingView()
    }
    
    func didEndLoading() {
        view?.dismissLoadingView()
    }
}

// MARK: - Constants

private extension CalendarPresenter {
    struct Constants {
        static let numberOfRowsInSection: Int = 1
    }
}
