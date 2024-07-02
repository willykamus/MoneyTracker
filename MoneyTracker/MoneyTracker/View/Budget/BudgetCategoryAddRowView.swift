//
//  BudgetCategoryAddRowView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-31.
//

import SwiftUI

struct BudgetCategoryAddRowView: View {
    
    @State var selectedCategory: SelectedCategory
    
    var body: some View {
        HStack {
            Text(selectedCategory.category.name)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("0.0", value: $selectedCategory.amount, format: .currency(code: "US"))               .keyboardType(.numberPad)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    BudgetCategoryAddRowView(selectedCategory: SelectedCategory(category: Category(type: .expense, name: "Hello", budget: nil, budgetAmount: 0), amount: 100.0))
}
