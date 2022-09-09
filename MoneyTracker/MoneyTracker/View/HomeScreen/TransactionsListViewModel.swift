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
        let transactions = await self.getTransactionsFromContainerInteractor.execute(containerId: container.id)
        self.transactions = transactions
    }
    
    
    
}
