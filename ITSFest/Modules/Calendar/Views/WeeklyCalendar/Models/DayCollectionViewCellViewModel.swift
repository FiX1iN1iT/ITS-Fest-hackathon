//
//  DayCollectionViewCellViewModel.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

struct DayCollectionViewCellViewModel {
    let weekday: NSAttributedString
    let dayOfMonth: NSAttributedString
    
    init(date: Date) {
        let weekdayLabelTitle = CalendarService.shared.extractDate(date: date, format: WeekdayLabel.format)
        let weekdayLabelAttributedString = NSAttributedString(string: weekdayLabelTitle, attributes: Styles.weekdayAttributes)
        let dayOfMonthLabelTitle = CalendarService.shared.extractDate(date: date, format: DayOfMonthLabel.format)
        let dayOfMonthLabelAttributedString = NSAttributedString(string: dayOfMonthLabelTitle, attributes: Styles.dayOfMonthAttributes)
        
        self.weekday = weekdayLabelAttributedString
        self.dayOfMonth = dayOfMonthLabelAttributedString
    }
}

private extension DayCollectionViewCellViewModel {
    struct Styles {
        static let weekdayAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]
        
        static let dayOfMonthAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ]
    }
    
    struct WeekdayLabel {
        static let format: String = "EEE"
    }
    
    struct DayOfMonthLabel {
        static let format: String = "dd"
    }
}
