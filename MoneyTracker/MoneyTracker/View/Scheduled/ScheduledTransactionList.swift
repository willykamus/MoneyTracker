//
//  ScheduledTransactionList.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-03-05.
//

import SwiftUI

struct ScheduledTransactionList: View {
    
    var scheduleTransactions: [ScheduledTransaction]
    
    @StateObject var scheduledTransactionListViewModel: ScheduledTransactionListViewModel
    
    init(scheduleTransactions: [ScheduledTransaction]) {
        self.scheduleTransactions = scheduleTransactions
        self._scheduledTransactionListViewModel = StateObject(wrappedValue: ScheduledTransactionListViewModel(scheduledTransactions: scheduleTransactions))
    }
    
    var body: some View {
        List(scheduledTransactionListViewModel.sections) { section in
            Section(section.date.description) {
                ForEach(section.scheduledTransactions, id: \.self) { scheduleTransaction in
                    ScheduledTransactionRow(scheduledTransaction: scheduleTransaction)
                }
            }
        }
    }
}

struct ScheduledTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledTransactionList(scheduleTransactions: [])
    }
}
