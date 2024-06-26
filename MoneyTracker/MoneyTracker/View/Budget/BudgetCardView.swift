//
//  BudgetCardView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-22.
//

import SwiftUI

struct BudgetCardView: View {
    @Bindable var budget: Budget
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(budget.title)
                
                Text("\(budget.categories.count) Categories")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
            
            Spacer()
            
            Text(budget.amount)
                .font(.title3.bold())
        }
    }
}

#Preview {
    BudgetCardView(budget: Budget(id: "", title: "", categories: []))
}
