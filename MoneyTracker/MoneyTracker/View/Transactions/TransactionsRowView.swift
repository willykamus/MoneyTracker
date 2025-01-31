//
//  TransactionsRowView.swift
//  MoneyTracker
//
//  Created by William Ching on 2025-01-28.
//

import SwiftUI
import SwiftData

struct TransactionsRowView: View {
    
    @Bindable var transaction: Transaction
    private var formatter: DateFormatter {
        let gg = DateFormatter()
        gg.dateStyle = .medium
        gg.timeStyle = .none
        return gg
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.category.name)
                    
                Text(formatter.string(from: transaction.date))
                    .font(.caption)
            }
            
            Spacer()
            
            Text(String(transaction.amount))
                .font(.headline)
        }
    }
}

//#Preview {
//    TransactionsRowView(transaction: Transaction(category: Category(type: .expense, name: "Hello", budget: nil, budgetAmount: 100.0), amount: 100, date: Date()))
//}
