//
//  Recurrence.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-11.
//

import Foundation

enum Recurrence: String, Codable, CaseIterable, Hashable {
    case day
    case week
    case twoWeeks
    case endOfMonth
    case month
    case sixMonths
    case year
    case never
}
