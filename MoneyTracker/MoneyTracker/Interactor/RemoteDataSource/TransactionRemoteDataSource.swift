//
//  TransactionRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol TransactionRemoteDataSource {
    func add(transaction: Transaction, to container: TransactionsContainer) async -> Bool
    func delete(transaction: Transaction)
    func getTransactions(id: String) async -> [Transaction]
    func getAllTransactions() async -> [Transaction]
}
