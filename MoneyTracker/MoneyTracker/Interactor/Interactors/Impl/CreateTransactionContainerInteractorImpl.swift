//
//  CreateTransactionContainerInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import Foundation

class CreateTransactionContainerInteractorImpl: CreateTransactionContainerInteractor {
    
    private var userRemoteDataSource: UserRemoteDataSource
    private var transactionContainerRemoteDataSource: TransactionsContainerRemoteDataSource
    
    init(userRemoteDataSource: UserRemoteDataSource, transactionContainerRemoteDataSource: TransactionsContainerRemoteDataSource) {
        self.userRemoteDataSource = userRemoteDataSource
        self.transactionContainerRemoteDataSource = transactionContainerRemoteDataSource
    }
    
    func execute(title: String) {
        if let user: User = userRemoteDataSource.currentUser() {
            transactionContainerRemoteDataSource.createContainer(container: TransactionsContainer(id: UUID().uuidString, name: title), user: user)
        }
    }
}
