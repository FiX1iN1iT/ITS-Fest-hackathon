//
//  CalendarService.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import Foundation

protocol CalendarServiceDescription {
    func fetchWeeklyCalendar(for date: Date) -> [[Date]]
    func getWeekdayIndex(from date: Date) -> Int
}

final class CalendarService: CalendarServiceDescription {
    private let calendar = Calendar.current
    
    func getWeekdayIndex(from date: Date) -> Int {
        let weekdayIndex = calendar.component(.weekday, from: date) - 2
        let localIndex = weekdayIndex == -1 ? 6 : weekdayIndex
        
        return localIndex
    }
    
    func fetchWeeklyCalendar(for date: Date) -> [[Date]] {
        let calendar = Calendar.current
        guard
            let startDate = calendar.date(byAdding: .year, value: -1, to: date),
            let endDate = calendar.date(byAdding: .year, value: 1, to: date),
            let startWeek = calendar.dateInterval(of: .weekOfMonth, for: startDate),
            let endWeek = calendar.dateInterval(of: .weekOfMonth, for: endDate)
        else {
            return []
        }
        
        var start = startWeek.start
        let end = endWeek.start
        
        var weekArray: [[Date]] = []
        while start <= end {
            weekArray.append(fetchWeek(for: start))
            guard let nextDate = calendar.date(byAdding: .day, value: 7, to: start) else {
                return []
            }
            start = nextDate
        }
        
        return weekArray
    }
}

private extension CalendarService {
    
    // MARK: - Helpers
    
    func fetchWeek(for date: Date) -> [Date] {
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: date)
        
        guard let firstWeekDay = week?.start else {
            return []
        }
        
        var dateArray: [Date] = []
        (0...6).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                dateArray.append(weekDay)
            }
        }
        
        return dateArray
    }
}
