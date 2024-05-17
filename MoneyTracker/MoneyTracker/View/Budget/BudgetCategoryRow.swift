//
//  BudgetCategoryRow.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-13.
//

import SwiftUI

struct BudgetCategoryRow: View {
    @Binding var category: BudgetCategory
    @State var amount: String = ""
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(category.category.name)
                Text(category.category.type.rawValue)
                    .foregroundStyle(.gray)
                    .font(.system(.caption))
            }
            
            Spacer()
            
            HStack(spacing: 2) {
                TextField("", text: self.$amount)
                    .fixedSize()
                    .onChange(of: self.amount) { value in
                        category.amount = Double(value) ?? 0
                    }
                Text("$")
            }
            
        }
        .task {
            self.amount = String(category.amount)
        }
    }
}

#Preview {
    BudgetCategoryRow(category: .constant(BudgetCategory(id: "", category: Category(id: "", type: .expense, name: "Hello"), amount: 100)))
}
