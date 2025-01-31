//
//  SaveTransactionInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-19.
//
//
//import Foundation
//
//class SaveTransactionInteractorImpl: SaveTransactionInteractor {
//    
//    let transactionRemoteDataSource: TransactionRemoteDataSource
//    let userRemoteDataSource: UserRemoteDataSource
//    
//    init(transactionRemoteDataSource: TransactionRemoteDataSource, userRemoteDataSource: UserRemoteDataSource) {
//        self.transactionRemoteDataSource = transactionRemoteDataSource
//        self.userRemoteDataSource = userRemoteDataSource
//    }
//    
//    func execute(transaction: Transaction, container: Wallet) async {
//        let user = userRemoteDataSource.currentUser()
//        await self.transactionRemoteDataSource.add(transaction: transaction, userId: user!.id)
//    }
//}
