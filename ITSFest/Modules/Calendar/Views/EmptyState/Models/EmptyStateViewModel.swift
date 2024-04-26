//
//  EmptyStateViewModel.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

struct EmptyStateViewViewModel {
    let title: NSAttributedString
    let logoImage: UIImage?
    
    init() {
        let titleLabelTitle = "Chilling..."
        let titleLabelAttributedString = NSAttributedString(string: titleLabelTitle, attributes: Styles.titleAttributes)
        let imageName = "logo"
        let image = UIImage(named: imageName)
        
        self.title = titleLabelAttributedString
        self.logoImage = image
    }
}

private extension EmptyStateViewViewModel {
    struct Styles {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 30, weight: .regular)
        ]
    }
}
