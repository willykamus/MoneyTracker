//
//  BudgetViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var budgets: Budget = Budget(id: UUID().uuidString, title: "Test", categories: [
        BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Mortgage"), amount: 1000),
        BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Car loan"), amount: 1000),
        BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .income, name: "Salary"), amount: 1000)])

}
