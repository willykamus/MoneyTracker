//
//  GetTransactionsForCategoryImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-17.
//

//import Foundation
//
//class GetTransactionsForCategoryImpl: GetTransactionsForCategory {
//    private let transactionsDataSource: TransactionRemoteDataSource = TransactionRemoteDataSourceImpl(dateProvider: DateProviderImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
//    private let userRemoteDataSource: UserRemoteDataSource = UserRemoteDataSourceImpl()
//    
//    func execute(category: Category) async -> Result<[Transaction], any Error> {
//        return await transactionsDataSource.getTransactions(category: category, userId: userRemoteDataSource.currentUser()!.id)
//    }
//}
