//
//  BUdgetRow.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-11.
//

import SwiftUI

struct BudgetRow: View {
    
    var budget: Budget
    
    var body: some View {
        VStack(spacing: 8) {
            Text(budget.title)
                .font(.system(size: 20, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                let count = budget.categories.count
                let text = count > 1 ? "Categories" : "Category"
                Text("\(count) \(text)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(String(budget.amount()))
            }
        }
    }
}

#Preview {
    BudgetRow(budget: Budget(id: "", title: "", categories: [BudgetCategory(id: "", category: Category(id: "", type: .expense, name: "Mortgage"), assignedAmount: 100)]))
}
