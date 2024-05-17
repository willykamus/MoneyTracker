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
                var count = budget.categories.count
                var text = count > 1 ? "Categories" : "Category"
                Text("\(count) \(text)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(String(budget.amount()))
            }
        }
    }
}

#Preview {
    BudgetRow(budget: Budget(id: "", title: "Gastos Esenciales", categories: [BudgetCategory(id: "", category: Category(id: "", type: .expense, name: "Gasto"), amount: 1000)]))
}
