//
//  ScheduledTransaction.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-11.
//

import Foundation

struct ScheduledTransaction: Identifiable, Hashable, Codable {
    var id: String
    var transaction: Transaction
    var recurrence: Recurrence
    var endDate: Date?
    
    func nextDate() -> Date {
        self.transaction.date
    }
}
