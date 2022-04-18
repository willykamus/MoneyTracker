//
//  GetAllTransactionsInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol GetAllTransactionsInteractor {
    func execute() async -> [Transaction]
}

class GetAllTransactionsInteractorImpl: GetAllTransactionsInteractor {
    
    var transactionRemoteDataSource: TransactionRemoteDataSource
    
    init(transactionRemoteDataSource: TransactionRemoteDataSource) {
        self.transactionRemoteDataSource = transactionRemoteDataSource
    }
    
    func execute() async -> [Transaction] {
        return await self.transactionRemoteDataSource.getAllTransactions()
    }
    
    
}
