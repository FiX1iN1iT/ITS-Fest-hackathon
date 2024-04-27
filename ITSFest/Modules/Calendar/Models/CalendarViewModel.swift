//
//  CalendarViewModel.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

struct CalendarViewModel {
    let title: NSAttributedString
    
    init() {
        let titleLabelTitle = Constants.TitleLabel.titleText
        let titleLabelAttributedString = NSAttributedString(string: titleLabelTitle, attributes: Styles.titleAttributes)
        
        title = titleLabelAttributedString
    }
}

private extension CalendarViewModel {
    struct Styles {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
    }
    
    struct Constants {
        struct TitleLabel {
            static let titleText: String = "Today's Tasks"
        }
    }
}
