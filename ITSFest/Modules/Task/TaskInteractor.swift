//
//  TaskIteractor.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation

final class TaskInteractor {
    weak var output: TaskInteractorOutput?
}

extension TaskInteractor: TaskInteractorInput {
    func loadProfile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let profile = Task(title: "MyTask", isCompleted: false)
            let result: Result<Task, Error> = .success(profile) // .failure(.unknowError)
            self?.output?.didReceive(result: result)
        }
    }
}
