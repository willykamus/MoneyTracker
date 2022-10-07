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
    @Published var incomeCategories: [Category] = []
    @Published var expensesCategories: [Category] = []
    
    let saveTransactionInteractor: SaveTransactionInteractor = SaveTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    
    let getCategories: GetCategoriesInteractor = GetCategoriesInteractorImpl()
    
    func save(category: Category) async -> Bool {
        if self.validateInput(category: category) {
            let transaction = Transaction(id: UUID().uuidString, amount: Double(amount)!, category: category.name, date: selectedDate, containerId: selectedContainer!.id)
            return await self.saveTransactionInteractor.execute(transaction: transaction, container: selectedContainer!)
        }
        return false
    }
    
    private func validateInput(category: Category) -> Bool {
        if let value: Double = Double(amount), value > 0, selectedContainer != nil, !category.id.isEmpty  {
            return true
        }
        return false
    }
    
    func getCategories() async {
        let result = await self.getCategories.execute()
        switch result {
        case .success(let categories):
            DispatchQueue.main.async {
                self.incomeCategories = categories.filter { $0.type == .income }
                self.expensesCategories = categories.filter { $0.type == .expense }
            }
        case .failure(_):
            return
        }
    }
}
