//
//  EmptyStateViewModel.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

struct EmptyStateViewViewModel {
    let title: NSAttributedString
    
    init() {
        let titleLabelTitle = Constants.titleText
        let titleLabelAttributedString = NSAttributedString(string: titleLabelTitle, attributes: Styles.titleAttributes)
        
        self.title = titleLabelAttributedString
    }
}

private extension EmptyStateViewViewModel {
    struct Styles {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.secondaryLabel,
            .font: UIFont.systemFont(ofSize: 30, weight: .regular)
        ]
    }
    
    struct Constants {
        static let titleText: String = "No tasks for today..."
    }
}
