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
    @Published var selectedRecurrence: Recurrence = .never
    
    let saveTransactionInteractor: SaveTransactionInteractor = SaveTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    let saveScheduleTransactionInteractor: SaveScheduleTransactionInteractor = SaveScheduleTransactionInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    let createNextScheduleTransactions: CreateNextScheduleTransactions = CreateNextScheduleTransactionsImpl()
    
    let getCategories: GetCategoriesInteractor = GetCategoriesInteractorImpl()
    
    func save(category: Category) async {
        if self.validateInput(category: category) {
            let transaction = Transaction(id: UUID().uuidString, amount: Double(amount)!, category: category.name, date: selectedDate, containerId: selectedContainer!.id, containerName: selectedContainer!.name, type: category.type)
            let scheduleTransaction = ScheduledTransaction(id: UUID().uuidString, transaction: transaction, recurrence: selectedRecurrence)
            if Calendar.current.isDate(transaction.date, inSameDayAs: Date()) {
                await self.saveTransactionInteractor.execute(transaction: transaction, container: selectedContainer!)
            } else {
                await self.saveScheduleTransactionInteractor.execute(transaction: scheduleTransaction, container: selectedContainer!)
            }
            
            if selectedRecurrence != .never {
                let transactions = createNextScheduleTransactions.execute(scheduledTransactions: [scheduleTransaction])
                for transaction in transactions {
                    await self.saveScheduleTransactionInteractor.execute(transaction: transaction, container: selectedContainer!)
                    return
                }
            }
            
            
        }
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
