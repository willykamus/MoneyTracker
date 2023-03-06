//
//  DeleteScheduledTransactionInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-26.
//

import Foundation

class DeleteScheduledTransactionInteractorImpl: DeleteScheduledTransactionInteractor {
    
    let transactionRemoteDataSource: TransactionRemoteDataSource
    let userRemoteDataSource: UserRemoteDataSource
    
    init(transactionRemoteDataSource: TransactionRemoteDataSource, userRemoteDataSource: UserRemoteDataSource) {
        self.transactionRemoteDataSource = transactionRemoteDataSource
        self.userRemoteDataSource = userRemoteDataSource
    }
    
    func execute(scheduledTransactions: [ScheduledTransaction]) async {
        let user = userRemoteDataSource.currentUser()
        for scheduledTransaction in scheduledTransactions {
            await transactionRemoteDataSource.delete(scheduleTransactionId: scheduledTransaction.id, containerId: scheduledTransaction.transaction.containerId, userId: user!.id)
        }
    }
}
