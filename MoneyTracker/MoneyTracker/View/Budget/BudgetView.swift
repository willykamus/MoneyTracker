//
//  BudgetView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import SwiftUI

struct BudgetView: View {
    
    @StateObject var budgetViewModel: BudgetViewModel = BudgetViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.$budgetViewModel.budgets) { budget in
                    Section {
                        ZStack {
                            BudgetRow(budget: budget.wrappedValue)
                            NavigationLink("", destination:
                                BudgetDetailView(budget: budget)
                            )
                            .buttonStyle(.plain)
                            .opacity(0.0)
                        }
                    }
                }
            }
            .navigationTitle("Budgets")
        }
    }
}

#Preview {
    BudgetView()
}
