//
//  BudgetViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import SwiftUI
import SwiftData

class BudgetViewModel: ObservableObject {
    
    @Published var budgetSections: [BudgetSection] = []
    
    func initialize(modelContext: ModelContext) {
        do {
            budgetSections = []
            let fetchDescriptor = FetchDescriptor<Budget>()
            let budgets = try modelContext.fetch(fetchDescriptor)
            let groups = Dictionary(grouping: budgets) { $0.type }
            groups.forEach { group in
                self.budgetSections.append(BudgetSection(title: group.key.rawValue, budgets: group.value))
            }
        } catch {
            
        }
    }
}

struct BudgetSection: Hashable {
    var title: String
    var budgets: [Budget]
}
