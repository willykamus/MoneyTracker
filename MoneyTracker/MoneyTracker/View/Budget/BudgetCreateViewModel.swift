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
    
    @Published var budget: Budget = Budget(id: UUID().uuidString, title: "", categories: [])
    @Published var availableCategories: [Category] = []
    @Published var selectedCategories: [Category] = []
    
    func getAvailableCategories(modelContext: ModelContext) {
        do {
            let fetchDescriptor = FetchDescriptor<Category>(predicate: #Predicate<Category> { category in category.budget == nil })
            let categories = try modelContext.fetch(fetchDescriptor)
            self.availableCategories = categories
        } catch {
            
        }
    }
    
    func assignCategoryToBudget(category: Category) {
        selectedCategories.append(category)
        availableCategories.removeAll { $0.id == category.id }
    }
    
    func removeCategory(category: Category) {
        selectedCategories.removeAll { $0.id == category.id }
    }
    
    func save() {
        budget.categories = selectedCategories
    }
}
