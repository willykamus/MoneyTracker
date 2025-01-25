//
//  CategoryMainViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2025-01-19.
//

import SwiftUI
import SwiftData

class CategoryMainViewModel: ObservableObject {
    @Published var categorySections: [CategorySections] = []
    
    func intialize(contex: ModelContext) {
        do {
            let fetchDescriptor = FetchDescriptor<Category>()
            let categories = try contex.fetch(fetchDescriptor)
            let expenses = categories.filter { $0.type == .expense }
            let incomes = categories.filter { $0.type == .income }
            categorySections = []
            categorySections.append(CategorySections(title: "Income", categories: incomes))
            categorySections.append(CategorySections(title: "Expenses", categories: expenses))
        } catch {
            
        }
    }
    
}

struct CategorySections: Hashable {
    var title: String
    var categories: [Category]
}
