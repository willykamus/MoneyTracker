//
//  TransactionRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol TransactionRemoteDataSource {
    func add(transaction: Transaction, containerId: String, userId: String) async -> Bool
    func delete(transaction: Transaction)
    func getTransactions(containerId: String, userId: String) async -> [Transaction]
    func getAllTransactions() async -> [Transaction]
}
