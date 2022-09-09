//
//  TransactionsListViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-12.
//

import Foundation

class TransactionsListViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    
    let getTransactionsFromContainerInteractor: GetTransactionsFromContainerInteractor = GetTransactionsFromContainerInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    
    func getTransactions(container: TransactionsContainer) async {
        self.transactions = container.transactions ?? []
    }
    
    
    
}
