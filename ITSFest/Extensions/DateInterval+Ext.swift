//
//  DateInterval+Ext.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import Foundation

extension DateInterval {
    func formattedInterval() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return "\(dateFormatter.string(from: start)) - \(dateFormatter.string(from: end))"
    }
}
