//
//  CreateTransactionViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import Foundation

class CreateTransactionViewModel: ObservableObject {
    
    @Published var amount: String = ""
    @Published var selectedDate: Date = Date()
    @Published var transactionsContainer: [TransactionsContainer] = []
    @Published var selectedContainer: TransactionsContainer?
    @Published var inputsValidated: Bool = false
    
    let saveTransactionInteractor: SaveTransactionInteractor = SaveTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    
    func save() async -> Bool {
        if self.validateInput() {
            let transaction = Transaction(id: UUID().uuidString, amount: Double(amount)!, category: "", date: selectedDate, containerId: selectedContainer!.id)
            return await self.saveTransactionInteractor.execute(transaction: transaction, container: selectedContainer!)
        }
        return false
    }
    
    private func validateInput() -> Bool {
        if let value: Double = Double(amount), value > 0, selectedContainer != nil {
            return true
        }
        return false
    }
    
    
    
}
