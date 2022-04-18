//
//  GetTransactionsFromContainerInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol GetTransactionsFromContainerInteractor {
    func execute(id: String) async -> [Transaction]
}

class GetTransactionsFromContainerInteractorImpl: GetTransactionsFromContainerInteractor {
    
    var transactionRemoteDataSource: TransactionRemoteDataSource
    
    init(transactionRemoteDataSource: TransactionRemoteDataSource) {
        self.transactionRemoteDataSource = transactionRemoteDataSource
    }
    
    func execute(id: String) async -> [Transaction] {
        return await self.transactionRemoteDataSource.getTransactions(id: id)
    }
    
    
}
