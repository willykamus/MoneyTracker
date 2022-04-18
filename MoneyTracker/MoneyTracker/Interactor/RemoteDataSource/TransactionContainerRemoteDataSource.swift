//
//  TransactionContainerRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol TransactionsContainerRemoteDataSource {
    func getContainers() async -> [TransactionsContainer]
    func createDataBase(for user: User)
    func createContainer(container: TransactionsContainer) -> Bool
}
