//
//  Date+Ext.swift
//  ITSFest
//
//  Created by Alexander on 27.04.2024.
//

import Foundation

extension Date {
    func formattedInterval() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return "\(dateFormatter.string(from: self))"
    }
}
