//
//  GetTransactionsContainerListInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation

class GetTransactionsContainerListInteractorImpl: GetTransactionsContainerListInteractor {
    
    private let transactionContainerRemoteDataSource: TransactionsContainerRemoteDataSource = TransactionsContainerRemoteDataSourceImpl()
    
    func execute() async -> [TransactionsContainer] {
        return await transactionContainerRemoteDataSource.getContainers()
    }
    
    
}
