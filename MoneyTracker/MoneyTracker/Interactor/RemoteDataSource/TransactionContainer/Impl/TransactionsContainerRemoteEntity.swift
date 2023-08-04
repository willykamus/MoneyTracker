//
//  TransactionsContainerRemoteEntity.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import Foundation
import FirebaseFirestoreSwift

struct TransactionsContainerRemoteEntity: Codable {
    var id: String?
    var name: String
    var transactions: [Transaction]?
    var scheduledTransactions: [ScheduledTransaction]?
}
