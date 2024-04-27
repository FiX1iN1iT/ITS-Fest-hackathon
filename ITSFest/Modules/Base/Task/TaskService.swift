//
//  TaskService.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import Foundation
import Firebase

enum CustomError: String, Error {
    case unknownError = "Неопределнная ошибка"
}

protocol TaskServiceDescription: AnyObject {
    func getTasks(on date: Date, completion: @escaping (Result<[CalendarTask], CustomError>) -> Void)
}

class TaskService: TaskServiceDescription {
    private let db = Firestore.firestore()
    
    // MARK: - GET
    
    func getTasks(on date: Date, completion: @escaping (Result<[CalendarTask], CustomError>) -> Void) {
//        guard let userUID = Auth.auth().currentUser?.uid else {
//            completion(.failure(.unknownError))
//            return
//        }
        
        let userUID = "qq5cLdhwheoTo3nJphHU"
        
        db.collection(Constants.userCollection)
            .document(userUID)
            .getDocument(as: TaskServiceUser.self) { result in
                switch result {
                case .success(let user):
                    guard let projects = user.projects else {
                        completion(.failure(.unknownError))
                        return
                    }

                    let group = DispatchGroup()
                    var calendarTasks: [CalendarTask] = []

                    for projectIndex in 0..<projects.count {
                        group.enter()
                        projects[projectIndex].getDocument(as: TaskServiceProject.self) { result in
                            defer {
                                group.leave()
                            }
                            
                            switch result {
                            case .success(let project):
                                guard let tasks = project.tasks else {
                                    completion(.failure(.unknownError))
                                    return
                                }
                                
                                for taskIndex in 0..<tasks.count {
                                    group.enter()
                                    tasks[taskIndex].getDocument(as: TaskServiceTask.self) { result in
                                        defer {
                                            group.leave()
                                        }

                                        switch result {
                                        case .success(let task):
                                            if Calendar.current.isDate(task.date, equalTo: date, toGranularity: .day) {
                                                calendarTasks.append(.init(dtoModel: task))
                                            }
                                            
                                        case .failure:
                                            completion(.failure(.unknownError))
                                        }
                                    }
                                }
                                
                            case .failure:
                                completion(.failure(.unknownError))
                            }
                        }
                    }

                    group.notify(queue: .main) {
                        completion(.success(calendarTasks.sorted(by: { $0.time < $1.time })))
                    }

                case .failure:
                    completion(.failure(.unknownError))
                }
            }
    }
}

// MARK: - Constants

private extension TaskService {
    struct Constants {
        static let userCollection = "user"
        static let projectCollection = "project"
        static let taskCollection = "task"
    }
}
