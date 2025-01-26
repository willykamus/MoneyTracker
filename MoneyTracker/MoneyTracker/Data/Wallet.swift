//
//  Wallet.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

struct Wallet: Identifiable, Hashable, Codable {
    
    static func == (lhs: Wallet, rhs: Wallet) -> Bool {
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
