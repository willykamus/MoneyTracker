//
//  BudgetDetailView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-13.
//

import SwiftUI

struct BudgetDetailView: View {
    
    @Bindable var budget: Budget
    
    var body: some View {
        List {
            ForEach(budget.categories) { category in
                Section {
                    DisclosureGroup(
                        content: { Text("Content") },
                        label: { 
                            HStack {
                                Text(category.name)
                                Spacer()
                                Text(String(category.budgetAmount ?? 0))
                            }
                        }
                    )
                }
            }
        }
    }
}
    

//import SwiftUI
//
//struct BudgetDetailView: View {
//    
//    @Binding var budget: Budget
//    @Binding var isPresented: Bool
//    
//    var body: some View {
//        NavigationStack {
//            Form(content: {
//                Section {
//                    TextField("", text: self.$budget.title, prompt: Text("General"))
//                } header: {
//                    Text("Title")
//                }
//                
//                Section {
//                    if budget.categories.isEmpty {
//                        ContentUnavailableView("No categories added", systemImage: "tray.fill")
//                    } else {
//                        ForEach($budget.categories, id: \.id) { category in
//                            HStack {
//                                Button(action: {
//                                    
//                                }, label: {
//                                    Image(systemName: "minus.circle.fill")
//                                })
//                                
//                                BudgetCategoryAddRowView(budgetCategory: category)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                            }
//                        }
//                    }
//                } header: {
////                    HStack {
////                        Spacer()
////                        Menu {
////                            ForEach(self.$budgetCreateViewModel.availableCategories, id: \.id) { category in
////                                Button {
////                                    self.budgetCreateViewModel.assignCategoryToBudget(category: category.wrappedValue)
////                                } label: {
////                                    Text(category.wrappedValue.name)
////                                        .textCase(.none)
////                                }
////                            }
////                        } label: {
////                            Image(systemName: "rectangle.stack.fill.badge.plus")
////                                .font(.title3)
////                                
////                        }
////                    }
//                    
//                }
//            })
//            .onAppear(perform: {
//                Task {
////                    await budgetCreateViewModel.getAvailableCategories()
//                }
//            })
////            .toolbar(content: {
////                ToolbarItem(placement: .topBarTrailing) {
////                    Button(action: {
////                        self.budgetCreateViewModel.save()
////                        self.isPresented.toggle()
////                    }, label: {
////                        Text("Add")
////                    })
////                }
////            })
//        .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//#Preview {
//    BudgetDetailView(budget: .constant(Budget(id: "", title: "", categories: [])), isPresented: .constant(true))
//}
