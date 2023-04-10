//
//  RecurrenceMapper.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-22.
//

import Foundation

class RecurrenceMapper {
    func value(recurrence: Recurrence) -> String {
        switch recurrence {
        case .day:
            return "Daily"
        case .week:
            return "Weekly"
        case .twoWeeks:
            return "Every two weeks"
        case .month:
            return "Monthly"
        case .sixMonths:
            return "Every six months"
        case .year:
            return "Every year"
        case .never:
            return "Never"
        }
    }
}
