//
//  BudgetCategoryDetailView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-17.
//

import SwiftUI

struct BudgetCategoryDetailView: View {
    
    @Binding var category: BudgetCategory
    @StateObject var budgetCategoryDetailViewModel: BudgetCategoryDetailViewModel = BudgetCategoryDetailViewModel()
    
    var body: some View {
        List {
            ForEach(budgetCategoryDetailViewModel.summaries, id:\.self) { summary in
                HStack {
                    Text(summary.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(summary.amount)
                }
            }
        }
        .task {
            await budgetCategoryDetailViewModel.initialize(category: category)
        }
    }
}

#Preview {
    BudgetCategoryDetailView(category: .constant(BudgetCategory(id: "", category: Category(id: "", type: .expense, name: "", budget: ""), assignedAmount: 100)))
}
