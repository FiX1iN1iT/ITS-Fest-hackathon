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
}
