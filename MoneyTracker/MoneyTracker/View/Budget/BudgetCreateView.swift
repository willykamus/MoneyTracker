//
//  BudgetCreateView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-31.
//

import SwiftUI

struct BudgetCreateView: View {
    
    @Environment(\.modelContext) private var context
    
    @ObservedObject var budgetCreateViewModel: BudgetCreateViewModel = BudgetCreateViewModel()
    @State var budgetName: String = ""
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            Form(content: {
                Section {
                    TextField("", text: self.$budgetCreateViewModel.budget.title, prompt: Text("General"))
                } header: {
                    Text("Title")
                }
                
                Section {
                    if budgetCreateViewModel.selectedCategories.isEmpty {
                        ContentUnavailableView("No categories selected", systemImage: "tray.fill")
                    } else {
                        ForEach(budgetCreateViewModel.selectedCategories) { category in
                            HStack {
                                Button(action: {
                                    budgetCreateViewModel.removeCategory(category: category)
                                }, label: {
                                    Image(systemName: "minus.circle.fill")
                                })
                                
//                                BudgetCategoryAddRowView(budgetCategory: category)
                                Text(category.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                    }
                } header: {
                    HStack {
                        Text("Categories")
                        Spacer()
                        Menu {
                            ForEach(self.$budgetCreateViewModel.availableCategories, id: \.id) { category in
                                Button {
                                    self.budgetCreateViewModel.assignCategoryToBudget(category: category.wrappedValue)
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
            .onAppear(perform: {                    
                self.budgetCreateViewModel.getAvailableCategories(modelContext: self.context)
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.budgetCreateViewModel.save()
                        self.isPresented.toggle()
                    }, label: {
                        Text("Add")
                    })
                }
            })
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BudgetCreateView(isPresented: .constant(true))
}
