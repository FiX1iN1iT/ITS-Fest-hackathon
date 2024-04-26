//
//  TaskService.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import Foundation

enum CustomError: String, Error {
    case unknownError = "Неопределнная ошибка"
}

protocol TaskServiceDescription: AnyObject {
    func getTasks(on date: Date, completion: @escaping (Result<[Task], CustomError>) -> Void)
}

class TaskService: TaskServiceDescription {
    func getTasks(on date: Date, completion: @escaping (Result<[Task], CustomError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(.success(Mock.mockTasks))
//            completion(.failure(.unknownError))
        }
    }
}
