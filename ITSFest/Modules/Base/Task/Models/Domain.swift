//
//  Domain.swift
//  ITSFest
//
//  Created by Alexander on 27.04.2024.
//

import Foundation

struct CalendarTask {
    let title: String
    let time: Date
    
    init() {
        title = ""
        time = Date()
    }
    
    init(title: String, time: Date) {
        self.title = title
        self.time = time
    }
    
    init(dtoModel: TaskServiceTask) {
        title = dtoModel.title
        time = dtoModel.date
    }
}
