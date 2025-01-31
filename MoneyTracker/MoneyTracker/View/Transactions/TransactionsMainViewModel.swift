//
//  TransactionsMainViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2025-01-25.
//

import Foundation
import SwiftData

class TransactionsMainViewModel: ObservableObject {
    @Published var transactionSection: [TransactionSection] = []
    
    
    
    func getSections(context: ModelContext) {
        do {
            transactionSection = []
            let descriptor = FetchDescriptor<Transaction>()
            let transactions = try context.fetch(descriptor)
            let groups = Dictionary(grouping: transactions, by: { $0.date.get(.year) })
            for year in groups.keys {
                let month = Dictionary(grouping: groups[year]!, by: { $0.date.getMonth() })
                month.forEach { tuple in
                    let section = TransactionSection(date: "\(year) - \(String(tuple.0)) ", transactions: tuple.1)
                    transactionSection.append(section)
                }
            }
        } catch {
            
        }
        
    }
    
    struct TransactionSection: Hashable {
        var date: String
        var transactions: [Transaction]
    }
}
