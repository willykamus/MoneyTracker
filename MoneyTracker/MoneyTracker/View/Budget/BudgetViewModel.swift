//
//  BudgetViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var budgets: [Budget] = []
    
    init() {
        self.budgets = [Budget(id: UUID().uuidString, title: "Test", categories: [
            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Mortgage"), amount: 1000),
            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Car loan"), amount: 1000)]),
                        Budget(id: UUID().uuidString, title: "Test 2", categories: [
                            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Mortgage"), amount: 100),
                            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Car loan"), amount: 1000)])]
    }
}
