//
//  TaskTableViewCellViewModel.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

struct TaskTableViewCellViewModel {
    let title: NSAttributedString
    let timeInterval: NSAttributedString
    
    init(task: Task) {
        let titleLabelTitle = task.title
        let titleLabelAttributedString = NSAttributedString(string: titleLabelTitle, attributes: Styles.titleAttributes)
        let timeIntervalLabelTitle = task.timeInterval.formattedInterval()
        let timeIntervalLabelAttributedString = NSAttributedString(string: timeIntervalLabelTitle, attributes: Styles.timeIntervalLabelTitleAttributes)
        
        title = titleLabelAttributedString
        timeInterval = timeIntervalLabelAttributedString
    }
}

private extension TaskTableViewCellViewModel {
    struct Styles {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        ]
        
        static let timeIntervalLabelTitleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.secondaryLabel,
            .font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ]
    }
}
