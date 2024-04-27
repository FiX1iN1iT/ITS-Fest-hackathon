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
    }

    func didTapChangeButton(with status: String) {
        router.openMain()
    }
}

private extension TaskPresenter {
}

extension TaskPresenter: TaskInteractorOutput {
}
