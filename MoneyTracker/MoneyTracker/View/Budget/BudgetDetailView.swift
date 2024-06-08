//
//  BudgetDetailView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-13.
//

import SwiftUI

struct BudgetDetailView: View {
    @Binding var budget: Budget
    
    var body: some View {
        List {
            Section {
                Section {
                    ForEach($budget.categories) { category in
                        BudgetCategoryRow(category: category)
                    }
                }
            } footer: {
                HStack {
                    Spacer()
                    Text("Total \(String(budget.amount()))")
                }
                
            }
        }.navigationTitle(budget.title)
    }
}

#Preview {
    BudgetDetailView(budget: .constant(
        Budget(id: UUID().uuidString, title: "Test", categories: [
            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Mortgage", budget: ""), assignedAmount: 100),
            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Restaurant", budget: ""), assignedAmount: 101),
            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Salario", budget: ""), assignedAmount: 102)])
    ))
}
