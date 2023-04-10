//
//  GetTransactionsContainerListInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation

class GetTransactionsContainerListInteractorImpl: GetTransactionsContainerListInteractor {
    
    private let transactionContainerRemoteDataSource: TransactionsContainerRemoteDataSource = TransactionsContainerRemoteDataSourceImpl()
    private let updateScheduledTransactionsInteractor: UpdateScheduledTransactionsInteractor = UpdateScheduledTransactionsInteractorImpl()
    
    func execute() async -> [TransactionsContainer] {
        let containers = await transactionContainerRemoteDataSource.getContainers()
        for container in containers {
            await updateScheduledTransactionsInteractor.execute(container: container)
        }
        return await transactionContainerRemoteDataSource.getContainers()
    }
}
