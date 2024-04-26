//
//  CalendarInteractor.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//  
//

import Foundation

final class CalendarInteractor {
    weak var output: CalendarInteractorOutput?
    var taskService: TaskServiceDescription?
}

extension CalendarInteractor: CalendarInteractorInput {
    func loadDay(_ date: Date) {
        self.output?.didStartLoading()
        taskService?.getTasks(on: date) { [weak self] result in
            guard let self else {
                return
            }
            self.output?.didEndLoading()

            switch result {
            case .success(let tasks):
                self.output?.didLoadDay(with: tasks)
            case .failure:
                self.output?.didLoadDay(with: [])
            }
        }
    }
}
