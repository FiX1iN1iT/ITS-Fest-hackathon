//
//  Models.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation
import UIKit

struct TaskViewModel {
    let infoTitle: NSAttributedString

    init(task: Task) {
        let infoTitleString = "\(task.title)"
        self.infoTitle = NSAttributedString(
            string: infoTitleString,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
            ]
        )
    }
}
