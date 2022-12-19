//
//  Transaction.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

struct Transaction: Identifiable, Hashable, Codable {
    var id: String
    var amount: Double
    var category: String
    var date: Date
    var containerId: String
    var type: TransactionType
}
