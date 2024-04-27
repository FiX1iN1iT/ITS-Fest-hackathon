//
//  DetailViewModel.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//

import Foundation

struct DetailViewModel {
    let projName: String
    let projDescription: String
    let projDueDate: Date
    let projTasks: [TaskModel]
    let projTeam: String
}

struct TaskModel {
    let title: String
    var isCompleted: Bool
}
