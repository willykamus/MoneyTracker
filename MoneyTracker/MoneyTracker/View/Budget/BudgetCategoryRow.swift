//
//  BudgetCategoryRow.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-13.
//

import SwiftUI

struct BudgetCategoryRow: View {
    @Binding var category: BudgetCategory
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(category.categoryName())
//                Text(category.category.first!.type.rawValue)
//                    .foregroundStyle(.gray)
//                    .font(.system(.caption))
            }
            
            Spacer()
            
            HStack(spacing: 2) {
                Text("\(String(category.assignedAmount)) $")
            }
            
        }
    }
}

#Preview {
    BudgetCategoryRow(category: .constant(
            BudgetCategory(id: UUID().uuidString, category: Category(id: UUID().uuidString, type: .expense, name: "Mortgage"), assignedAmount: 100))
    )
}
