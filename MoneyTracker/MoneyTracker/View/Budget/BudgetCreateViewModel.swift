//
//  BudgetCreateViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-02.
//

import Foundation
import SwiftUI
import SwiftData

class BudgetCreateViewModel: ObservableObject {
    
    @Published var budget: Budget = Budget(id: UUID().uuidString, title: "", categories: [], type: .expense)
    @Published var availableCategories: [Category] = []
    @Published var selectedCategories: [SelectedCategory] = []
    @Published var selectedType: TransactionType = .expense
    var context: ModelContext?
    
    func getAvailableCategories(modelContext: ModelContext) {
        do {
            self.context = modelContext
            let fetchDescriptor = FetchDescriptor<Category>(predicate: #Predicate<Category> { category in category.budget == nil })
            let categories = try modelContext.fetch(fetchDescriptor)
            self.availableCategories = categories.filter { $0.type == self.selectedType}
        } catch {
            
        }
    }
    
    func onChangeType(type: TransactionType) {
        self.selectedType = type
        getAvailableCategories(modelContext: self.context!)
    }
    
    func assignCategoryToBudget(category: Category) {
        selectedCategories.append(SelectedCategory(category: category, amount: 0.0))
        availableCategories.removeAll { $0.id == category.id }
    }
    
    func removeCategory(category: Category) {
        selectedCategories.removeAll { $0.category.id == category.id }
        availableCategories.append(category)
    }
    
    func save() {
        for selectedCategory in selectedCategories {
            selectedCategory.category.budgetAmount = selectedCategory.amount
            budget.categories.append(selectedCategory.category)
        }
        self.budget.type = self.selectedType
    }
}

struct SelectedCategory: Identifiable {
    var id: UUID = UUID()
    var category: Category
    var amount: Double
}
