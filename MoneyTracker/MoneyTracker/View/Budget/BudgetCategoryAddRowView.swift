//
//  BudgetCategoryAddRowView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-31.
//

import SwiftUI

struct BudgetCategoryAddRowView: View {
    
    @Binding var budgetCategory: BudgetCategory
    @State var assignedAmount: Double = 0.0
    
    var body: some View {
        HStack {
            Text(budgetCategory.categoryName())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("0.0", value: $assignedAmount, format: .currency(code: "US"))                    .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .onChange(of: self.assignedAmount) { oldValue, newValue in
                    self.budgetCategory.assignedAmount = newValue
                }
        }
        .task {
            if budgetCategory.assignedAmount > 0 {
                self.assignedAmount = budgetCategory.assignedAmount
            }
        }
        
    }
}

#Preview {
    BudgetCategoryAddRowView(budgetCategory: .constant(BudgetCategory(id: "", category: Category(id: "", type: .expense, name: "Category", budget: ""), assignedAmount: 100)))
}
