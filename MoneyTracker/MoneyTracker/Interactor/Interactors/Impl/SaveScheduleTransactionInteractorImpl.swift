//
//  SaveScheduleTransactionInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-23.
//

import Foundation

class SaveScheduleTransactionInteractorImpl: SaveScheduleTransactionInteractor {
    
    let transactionRemoteDataSource: TransactionRemoteDataSource
    let userRemoteDataSource: UserRemoteDataSource
    
    init(transactionRemoteDataSource: TransactionRemoteDataSource, userRemoteDataSource: UserRemoteDataSource) {
        self.transactionRemoteDataSource = transactionRemoteDataSource
        self.userRemoteDataSource = userRemoteDataSource
    }
    
    func execute(transaction: ScheduledTransaction, container: TransactionsContainer) async -> Bool {
        let user = userRemoteDataSource.currentUser()
        return await self.transactionRemoteDataSource.add(scheduleTransaction: transaction, containerId: container.id, userId: user!.id)
    }
}
