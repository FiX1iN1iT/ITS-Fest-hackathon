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
    func loadTasks(for date: Date) {
        guard 
            let output = output,
            let taskService = taskService
        else {
            return
        }
        
        output.didStartLoading()
        taskService.getTasks(on: date) { [weak self] result in
            guard let self else {
                return
            }
            output.didEndLoading()

            switch result {
            case .success(let tasks):
                output.didLoadDay(with: tasks)
            case .failure:
                output.didLoadDay(with: [])
            }
        }
    }
}
