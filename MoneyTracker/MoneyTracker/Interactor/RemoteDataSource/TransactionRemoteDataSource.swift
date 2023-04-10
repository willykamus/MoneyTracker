//
//  TransactionRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol TransactionRemoteDataSource {
    func add(transaction: Transaction, containerId: String, userId: String) async
    func add(scheduleTransaction: ScheduledTransaction, containerId: String, userId: String) async
    func delete(transaction: Transaction) async
    func delete(scheduleTransactionId: String, containerId: String, userId: String) async
    func getTransactions(containerId: String, userId: String) async -> [Transaction]
    func getAllTransactions() async -> [Transaction]
}
