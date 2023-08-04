//
//  UpdateScheduledTransactionsInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-26.
//

import Foundation

class UpdateScheduledTransactionsInteractorImpl: UpdateScheduledTransactionsInteractor {
    
    let createNextScheduleTransactions: CreateNextScheduleTransactions = CreateNextScheduleTransactionsImpl()
    let deleteScheduledTransactionInteractor: DeleteScheduledTransactionInteractor = DeleteScheduledTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(dateProvider: DateProviderImpl(), userRemoteDataSource: UserRemoteDataSourceImpl()), userRemoteDataSource: UserRemoteDataSourceImpl())
    let saveTransactionInteractorImpl: SaveTransactionInteractorImpl = SaveTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(dateProvider: DateProviderImpl(), userRemoteDataSource: UserRemoteDataSourceImpl()), userRemoteDataSource: UserRemoteDataSourceImpl())
    let saveScheduleTransactionInteractor: SaveScheduleTransactionInteractor = SaveScheduleTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(dateProvider: DateProviderImpl(), userRemoteDataSource: UserRemoteDataSourceImpl()), userRemoteDataSource: UserRemoteDataSourceImpl())
    
    func execute(container: TransactionsContainer) async {
        let currentScheduledTransaction: [ScheduledTransaction] = container.scheduledTransactions ?? []
        var scheduledTransactionsToDelete: [ScheduledTransaction] = []
        for scheduledTransaction in currentScheduledTransaction {
            if Calendar.current.isDate(scheduledTransaction.nextDate(), inSameDayAs: Date()) || scheduledTransaction.nextDate() < Date() {
                scheduledTransactionsToDelete.append(scheduledTransaction)
            }
        }
        await deleteScheduledTransactionInteractor.execute(scheduledTransactions: scheduledTransactionsToDelete)
        for scheduledTransaction in scheduledTransactionsToDelete {
            await saveTransactionInteractorImpl.execute(transaction: scheduledTransaction.transaction, container: container)
            if scheduledTransaction.endDate == nil {
                let newTransactions = createNextScheduleTransactions.execute(scheduledTransactions: [scheduledTransaction])
                for transaction in newTransactions {
                    await saveScheduleTransactionInteractor.execute(transaction: transaction, container: container)
                }
            }
        }
    }
}
