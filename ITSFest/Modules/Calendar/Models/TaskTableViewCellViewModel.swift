//
//  TaskTableViewCellViewModel.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

struct TaskTableViewCellViewModel {
    let title: NSAttributedString
    let time: NSAttributedString
    
    init(task: CalendarTask) {
        let titleLabelTitle = task.title
        let titleLabelAttributedString = NSAttributedString(string: titleLabelTitle, attributes: Styles.titleAttributes)
        let timeLabelTitle = task.time.formattedInterval()
        let timeLabelAttributedString = NSAttributedString(string: timeLabelTitle, attributes: Styles.timeLabelTitleAttributes)
        
        title = titleLabelAttributedString
        time = timeLabelAttributedString
    }
}

private extension TaskTableViewCellViewModel {
    struct Styles {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        ]
        
        static let timeLabelTitleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.secondaryLabel,
            .font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ]
    }
}
