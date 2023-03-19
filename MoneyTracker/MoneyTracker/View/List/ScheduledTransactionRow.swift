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
            VStack {
                Text(scheduledTransaction.transaction.category)
                Text(scheduledTransaction.transaction.containerId)
            }
            Spacer()
            Text(String(scheduledTransaction.transaction.amount))
        }
        
    }
}
//
//struct ScheduledTransactionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ScheduledTransactionRow(scheduledTransaction: <#ScheduledTransaction#>)
//    }
//}
