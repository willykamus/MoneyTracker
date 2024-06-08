//
//  BudgetView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import SwiftUI

struct BudgetView: View {
    
    @StateObject var budgetViewModel: BudgetViewModel = BudgetViewModel()
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach($budgetViewModel.budget) { budget in
                        DisclosureGroup(
                            content: {
                                if budget.categories.isEmpty {
                                    ContentUnavailableView("No categories selected", systemImage: "tray.fill")
                                } else {
                                    ForEach(budget.categories) { budgetCategory in
                                        NavigationLink {
                                            Text("Hello WOrld")
                                        } label: {
                                            HStack {
                                                Text(budgetCategory.wrappedValue.categoryName())
                                                Spacer()
                                                Text(String(budgetCategory.wrappedValue.assignedAmount))
                                            }
                                            .listRowInsets(.none)
                                        }
                                    }
                                }
                            },
                            label: {
                                Button(action: {
                                    self.isPresented = true
                                }, label: {
                                    HStack {
                                        Text(budget.wrappedValue.title)
                                        Spacer()
                                        Text(String(budget.wrappedValue.amount()))
                                    }
                                    
                                })
                                .foregroundStyle(.black)
                            }
                        )
                    }
                    .onDelete { indexs in
                        print("Deleting")
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            self.isPresented = true
                        } label: {
                            FloatingButton()
                        }
                        .padding(.horizontal,32)
                        .padding(.vertical,16)
                    }
                }
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Budgets")
            .navigationDestination(isPresented: self.$isPresented) {
                VStack {
                    BudgetCreateView()
                }
            }
        }
    }
}

#Preview {
    BudgetView()
}
