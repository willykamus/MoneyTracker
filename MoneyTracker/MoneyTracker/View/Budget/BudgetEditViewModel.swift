//
//  BudgetEditViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2025-01-19.
//

import SwiftUI
import SwiftData

class BudgetEditViewModel: ObservableObject {
    
    @Published var currentBudget: Budget = Budget(id: "", title: "", categories: [], type: .expense)
    @Published var availableCategoriesToAdd: [SelectedCategory] = []
    
    func initialize(currentBudget: Budget) {
        self.currentBudget = currentBudget
        self.availableCategoriesToAdd = availableCategoriesToAdd
    }
    
    func getAvailableCategories(modelContext: ModelContext) {
        do {
            let fetchDescriptor = FetchDescriptor<Category>(predicate: #Predicate<Category> { category in
                category.budget == nil
            })
            let categories = try modelContext.fetch(fetchDescriptor)
            let availableCategories = categories.filter { !currentBudget.categories.contains($0) }
            self.availableCategoriesToAdd = availableCategories.map { SelectedCategory(category: $0, amount: 0.0)}
        } catch {
            
        }
    }
    
    func assignCategoryToBudget(selectedCategory: SelectedCategory) {
        let currentCategory = selectedCategory.category
        currentCategory.budgetAmount = selectedCategory.amount
        self.currentBudget.categories.append(currentCategory)
//        availableCategoriesToAdd.removeAll { $0.category.id == currentCategory.id }
    }
}
