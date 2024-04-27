//
//  Task.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import Foundation

struct CalendarTask {
    let title: String
    let time: Date
}

struct Mock {
    static let mockTasks: [CalendarTask] = [
        .init(title: "User Interviews", time: Date()),
        .init(title: "Icons", time: Date()),
        .init(title: "Mockups", time: Date()),
        .init(title: "Testing", time: Date()),
        .init(title: "Finish", time: Date())
    ]
}
