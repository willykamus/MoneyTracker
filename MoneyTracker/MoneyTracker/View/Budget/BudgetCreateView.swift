//
//  BudgetCreateView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-31.
//

import SwiftUI

struct BudgetCreateView: View {
    
    @State var budgetCreateViewModel: BudgetCreateViewModel = BudgetCreateViewModel()
    @State var budgetName: String = ""
    @State var budgetCategories: [BudgetCategory] = []
    @State var availableCategories: [Category] = []
    
    var body: some View {
        Form(content: {
            Section {
                TextField("", text: self.$budgetName, prompt: Text("General"))
            } header: {
                Text("Title")
            }
            
            Section {
                if budgetCategories.isEmpty {
                    ContentUnavailableView("No categories added", systemImage: "tray.fill")
                } else {
                    ForEach($budgetCategories) { category in
                        BudgetCategoryAddRowView(budgetCategory: category)
                    }
                }
            } header: {
                HStack {
                    Spacer()
                    Menu {
                        ForEach(self.$availableCategories, id: \.id) { category in
                            Button {
                                print("Hello World")
                            } label: {
                                Text(category.wrappedValue.name)
                                    .textCase(.none)
                            }
                        }
                    } label: {
                        Image(systemName: "rectangle.stack.fill.badge.plus")
                            .font(.title3)
                    }
                }

            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .task {
            var categories = await budgetCreateViewModel.getAvailableCategories()
            DispatchQueue.main.async {
                self.availableCategories.append(contentsOf: categories)
            }
        }
    }
}

#Preview {
    BudgetCreateView()
}
