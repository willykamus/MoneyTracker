//
//  UpdateScheduledTransactionsInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-26.
//

import Foundation

class UpdateScheduledTransactionsInteractorImpl: UpdateScheduledTransactionsInteractor {
    
    let createNextScheduleTransactions: CreateNextScheduleTransactions = CreateNextScheduleTransactionsImpl()
    let deleteScheduledTransactionInteractor: DeleteScheduledTransactionInteractor = DeleteScheduledTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    let saveTransactionInteractorImpl: SaveTransactionInteractorImpl = SaveTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    let saveScheduleTransactionInteractor: SaveScheduleTransactionInteractor = SaveScheduleTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    
    func execute(container: TransactionsContainer) async {
        let currentScheduledTransaction: [ScheduledTransaction] = container.scheduledTransactions ?? []
        var scheduledTransactionsToDelete: [ScheduledTransaction] = []
        for scheduledTransaction in currentScheduledTransaction {
            if scheduledTransaction.nextDate() <= Date() {
                scheduledTransactionsToDelete.append(scheduledTransaction)
            }
        }
        await deleteScheduledTransactionInteractor.execute(scheduledTransactions: scheduledTransactionsToDelete)
        for scheduledTransaction in scheduledTransactionsToDelete {
            await saveTransactionInteractorImpl.execute(transaction: scheduledTransaction.transaction, container: container)
        }
    }
}
