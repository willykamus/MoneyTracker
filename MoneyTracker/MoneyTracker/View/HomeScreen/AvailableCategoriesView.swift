//
//  AvailableCategoriesView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-10-07.
//

import SwiftUI

struct AvailableCategoriesView: View {
    
    @Binding var selectedCategory: Category
    @Binding var listPresented: Bool
    @Binding var incomeCategories: [Category]
    @Binding var expenseCategories: [Category]
    
    var body: some View {
        List {
            Section("Income") {
                ForEach(incomeCategories) { income in
                    Button {
                        self.selectedCategory = income
                        self.listPresented.toggle()
                    } label: {
                        Text(income.name)
                    }
                }
            }
            
            Section("Expense") {
                ForEach(expenseCategories) { expense in
                    Button {
                        self.selectedCategory = expense
                        self.listPresented.toggle()
                    } label: {
                        Text(expense.name)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct AvailableCategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        AvailableCategoriesView(selectedCategory: .constant(Category(id: "", type: .income, name: "")), listPresented: .constant(true), categories: .constant([]))
//    }
//}
