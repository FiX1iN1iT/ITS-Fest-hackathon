//
//  Task.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import Foundation

struct Task {
    let title: String
    let timeInterval: DateInterval
}

struct Mock {
    static let mockTasks: [Task] = [
        .init(title: "User Interviews", timeInterval: .init(start: Date(), duration: 3600)),
        .init(title: "Icons", timeInterval: .init(start: Date(), duration: 3600)),
        .init(title: "Mockups", timeInterval: .init(start: Date(), duration: 3600)),
        .init(title: "Testing", timeInterval: .init(start: Date(), duration: 3600)),
        .init(title: "Finish", timeInterval: .init(start: Date(), duration: 3600))
    ]
}
