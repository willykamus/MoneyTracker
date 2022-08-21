//
//  SaveTransactionInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-19.
//

import Foundation

class SaveTransactionInteractorImpl: SaveTransactionInteractor {
    
    let transactionRemoteDataSource: TransactionRemoteDataSource
    let userRemoteDataSource: UserRemoteDataSource
    
    init(transactionRemoteDataSource: TransactionRemoteDataSource, userRemoteDataSource: UserRemoteDataSource) {
        self.transactionRemoteDataSource = transactionRemoteDataSource
        self.userRemoteDataSource = userRemoteDataSource
    }
    
    func execute(transaction: Transaction, container: TransactionsContainer) async -> Bool {
        let user = userRemoteDataSource.currentUser()
        return await self.transactionRemoteDataSource.add(transaction: transaction, containerId: container.id, userId: user!.id)
    }
}
