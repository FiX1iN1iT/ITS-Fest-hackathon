//
//  Date+Ext.swift
//  ITSFest
//
//  Created by Alexander on 27.04.2024.
//

import Foundation

extension Date {    
    func extractDate(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
