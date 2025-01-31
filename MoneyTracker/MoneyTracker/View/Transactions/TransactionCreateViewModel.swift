//
//  TransactionCreateViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2025-01-25.
//

import Foundation
import SwiftData

class TransactionCreateViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var category: Category = Category(type: .expense, name: "")
    @Published var amount: Double = 0.0
    @Published var date: Date = Date()
    
    @Published var categories: [Category] = []
    
    private var modelContext: ModelContext?
    
    func getCategories(context:  ModelContext) {
        modelContext = context
        do {
            var descriptor = FetchDescriptor<Category>()
            var categories = try context.fetch(descriptor)
            self.categories = categories
        } catch {
            
        }

    }
    
    func save() {
        modelContext!.insert(Transaction(category: self.category, amount: self.amount, date: self.date))
    }
}
