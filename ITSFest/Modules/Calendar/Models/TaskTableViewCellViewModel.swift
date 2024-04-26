//
//  TaskTableViewCellViewModel.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

struct TaskTableViewCellViewModel {
    let title: String
    let timeInterval: String
    
    init(task: Task) {
        title = task.title
        timeInterval = task.timeInterval.formattedInterval()
    }
}
