//
//  GetTransactionsFromContainerInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol GetTransactionsFromContainerInteractor {
    func execute(containerId: String) async -> [Transaction]
}

class GetTransactionsFromContainerInteractorImpl: GetTransactionsFromContainerInteractor {
    
    var transactionRemoteDataSource: TransactionRemoteDataSource
    var userRemoteDataSource: UserRemoteDataSource
    
    init(transactionRemoteDataSource: TransactionRemoteDataSource, userRemoteDataSource: UserRemoteDataSource) {
        self.transactionRemoteDataSource = transactionRemoteDataSource
        self.userRemoteDataSource = userRemoteDataSource
    }
    
    func execute(containerId: String) async -> [Transaction] {
        let user = userRemoteDataSource.currentUser()
        return await self.transactionRemoteDataSource.getTransactions(containerId: containerId, userId: user!.id)
    }
    
    
}
