//
//  BudgetCategoryAddRowView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-31.
//

import SwiftUI

struct BudgetCategoryAddRowView: View {
    
    @Binding var category: Category
    @State var assignedAmount: Double = 0.0
    
    var body: some View {
        HStack {
            Text(category.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("0.0", value: $assignedAmount, format: .currency(code: "US"))                    .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
                .onChange(of: self.assignedAmount) { oldValue, newValue in
                    self.category.budgetAmount = newValue
                }
        }
        .task {
            if category.budgetAmount ?? 0 > 0 {
                self.assignedAmount = category.budgetAmount!
            }
        }
        
    }
}

#Preview {
    BudgetCategoryAddRowView(category: .constant(Category(type: .expense, name: "Category", budgetAmount: 100)), assignedAmount: 0.0)
}
