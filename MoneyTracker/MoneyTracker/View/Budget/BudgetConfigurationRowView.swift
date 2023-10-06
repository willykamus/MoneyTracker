//
//  BudgetConfigurationRowView.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-08-28.
//

import SwiftUI

struct BudgetConfigurationRowView: View {
    
    @Binding var budgetCategory: BudgetCategory
    @FocusState private var usernameFieldIsFocused: Bool
    
    var body: some View {
        HStack {
            Text(budgetCategory.category.name)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextField("Amount", text: self.$budgetCategory.amount)
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
                .focused($usernameFieldIsFocused)
        }
        .onDisappear {
            self.usernameFieldIsFocused = false
        }
    }
}

struct BudgetConfigurationRowView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetConfigurationRowView(budgetCategory: .constant(BudgetCategory(category: Category(id: "", type: .expense, name: "", budgetCategoryType: .income), amount: "")))
    }
}
