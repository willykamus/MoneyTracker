//
//  ScheduledTransactionRow.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-03-05.
//

import SwiftUI

struct ScheduledTransactionRow: View {
    
    var scheduledTransaction: ScheduledTransaction
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(scheduledTransaction.transaction.category)
                    .font(.system(size: 16))
                Text(RecurrenceMapper().value(recurrence: scheduledTransaction.recurrence))
                    .font(.system(size: 12))
                Text(scheduledTransaction.transaction.containerName)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Text(String(scheduledTransaction.transaction.amount))
                .font(.system(size: 16))
        }
        
    }
}

struct ScheduledTransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledTransactionRow(scheduledTransaction: ScheduledTransaction(id: "1", transaction: Transaction(id: "1", amount: 10.0, category: "Category", date: Date(), containerId: "3", containerName: "Wallet", type: .expense), recurrence: .week))
    }
}
