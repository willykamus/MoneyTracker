//
//  BudgetViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var budget: [Budget] = [Budget(id: UUID().uuidString, title: "Esenciales", categories: [
        BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Mortgage", budget: ""), assignedAmount: 100),
        BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Seguro", budget: ""), assignedAmount: 101),
        BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Carro", budget: ""), assignedAmount: 102)])]

}
