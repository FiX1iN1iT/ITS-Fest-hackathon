//
//  TaskPresenter.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation
import UIKit

final class TaskPresenter {
    weak var view: TaskViewInput?

    private let router: TaskRouterInput
    private let interactor: TaskInteractorInput

    private var task: Task?

    init(router: TaskRouterInput, interactor: TaskInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension TaskPresenter: TaskViewOutput {
    func didTapCreateButton() {
        print(#function)
    }
    
    func didTapDateButton() {
        print(#function)
    }
    
    func didTapTimeButton() {
        print(#function)
    }
    
    func didLoadView() {
        interactor.loadProfile()
    }

    func didTapChangeButton(with status: String) {
        router.openMain()
    }
}

private extension TaskPresenter {
    func didLoadProfile(with task: Task) {
        self.task = task

        let viewModel = TaskViewModel(task: task)
        view?.configure(with: viewModel)
    }
}

extension TaskPresenter: TaskInteractorOutput {
    func didReceive(result: Result<Task, Error>) {
    }
}
