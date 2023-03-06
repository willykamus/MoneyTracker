//
//  Wallet.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

struct TransactionsContainer: Identifiable, Hashable, Codable {
    
    static func == (lhs: TransactionsContainer, rhs: TransactionsContainer) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String
    var transactions: [Transaction]?
    var scheduledTransactions: [ScheduledTransaction]?
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
