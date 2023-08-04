//
//  CreateNextMonthScheduleTransactions.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-12.
//

import Foundation

protocol CreateNextScheduleTransactions {
    func execute(scheduledTransactions: [ScheduledTransaction]) -> [ScheduledTransaction]
}

class CreateNextScheduleTransactionsImpl: CreateNextScheduleTransactions {
    
    func execute(scheduledTransactions: [ScheduledTransaction]) -> [ScheduledTransaction] {
        var newTransactions: [ScheduledTransaction] = []
        for scheduledTransaction in scheduledTransactions {
            var newTransaction = scheduledTransaction.transaction
            let date = scheduledTransaction.transaction.date
            switch scheduledTransaction.recurrence {
            case .day:
                for i in 0..<Calendar.current.numberOfDaysBetween(from: date, to: Date().endOfMonth()) {
                    newTransaction.date = Calendar.current.date(byAdding: .day, value: i + 1, to: date)!
                    let scheduled = ScheduledTransaction(id: UUID().uuidString, transaction: newTransaction, recurrence: scheduledTransaction.recurrence)
                    newTransactions.append(scheduled)
                }
            case .week:
                let weeks = Calendar.current.dateComponents([.weekOfMonth], from: date, to: date.endOfMonth()).weekOfMonth ?? 0
                if weeks > 0 {
                    for i in 0..<weeks {
                        newTransaction.date = Calendar.current.date(byAdding: .weekOfMonth, value: i + 1, to: date)!
                        let scheduled = ScheduledTransaction(id: UUID().uuidString, transaction: newTransaction, recurrence: scheduledTransaction.recurrence)
                        newTransactions.append(scheduled)
                    }
                } else {
                    let nextMonth = Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: date)!
                    let weeks = Calendar.current.dateComponents([.weekOfMonth], from: nextMonth, to: nextMonth.endOfMonth()).weekOfMonth ?? 0
                    if weeks > 0 {
                        let scheduled = ScheduledTransaction(id: UUID().uuidString, transaction: newTransaction, recurrence: scheduledTransaction.recurrence)
                        newTransactions.append(scheduled)
                        for i in 0..<weeks {
                            newTransaction.date = Calendar.current.date(byAdding: .weekOfMonth, value: i + 1, to: nextMonth)!
                            let scheduled = ScheduledTransaction(id: UUID().uuidString, transaction: newTransaction, recurrence: scheduledTransaction.recurrence)
                            newTransactions.append(scheduled)
                        }
                    }
                }

            case .twoWeeks:
                let remainingWeeks = Calendar.current.dateComponents([.weekOfMonth], from: date, to: date.endOfMonth()).weekOfMonth ?? 0
                if (remainingWeeks / 2) >= 1 {
                    for i in 0..<(remainingWeeks / 2) {
                        newTransaction.date = Calendar.current.date(byAdding: .weekOfMonth, value: i + 2, to: date)!
                        let scheduled = ScheduledTransaction(id: UUID().uuidString, transaction: newTransaction, recurrence: scheduledTransaction.recurrence)
                        newTransactions.append(scheduled)
                    }
                }
            case .month:
                newTransaction.date = Calendar.current.date(byAdding: .month, value: 1, to: date)!
                let scheduled = ScheduledTransaction(id: UUID().uuidString, transaction: newTransaction, recurrence: scheduledTransaction.recurrence)
                newTransactions.append(scheduled)
            default:
                break
            }
        }
        return newTransactions
        
    }
}
