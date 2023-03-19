//
//  ScheduledTransactionListViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-03-07.
//

import Foundation

class ScheduledTransactionListViewModel: ObservableObject {
    
    @Published var sections: [ScheduledTransactionListRow] = []
    
    init(scheduledTransactions: [ScheduledTransaction]) {
        var sections: [ScheduledTransactionListRow] = []
        let dates = scheduledTransactions.map { $0.nextDate() }
        for date in dates {
            let transactions = scheduledTransactions.filter { $0.nextDate() == date }
            sections.append(ScheduledTransactionListRow(date: date, scheduledTransactions: transactions))
        }
        self.sections = sections
    }
}

struct ScheduledTransactionListRow: Identifiable {
    var id: String = UUID().uuidString
    var date: Date
    var scheduledTransactions: [ScheduledTransaction]
}
