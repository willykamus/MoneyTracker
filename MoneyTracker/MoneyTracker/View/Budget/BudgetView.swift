//
//  BudgetView.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import SwiftUI
import SwiftData

struct BudgetView: View {
    
//    @Query(animation: .snappy) private var budgets: [Budget]
    @Environment(\.modelContext) private var context
    @StateObject var viewModel = BudgetViewModel()
    
    @State var create: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if self.viewModel.budgetSections.isEmpty {
                    ContentUnavailableView("No budget created", systemImage: "tray.fill")
                } else {
                    List {
                        ForEach(self.viewModel.budgetSections, id: \.self) { budgetSection in
                            Section {
                                ForEach(budgetSection.budgets) { budget in
                                    NavigationLink {
                                        BudgetDetailView(budget: budget)
                                    } label: {
                                        BudgetCardView(budget: budget)
                                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                                Button(action: {
                                                    context.delete(budget)
                                                    self.viewModel.initialize(modelContext: self.context)
                                                }, label: {
                                                    Image(systemName: "trash")
                                                })
                                                .tint(.red)
                                            }
                                    }
                                }
                                
                            } header: {
                                Text(budgetSection.title)
                            }
//                            DisclosureGroup(
//                                content: {
//                                    if budget.categories.isEmpty {
//                                        ContentUnavailableView("No categories selected", systemImage: "tray.fill")
//                                    } else {
//                                        ForEach(budget.categories) { category in
//                                            NavigationLink {
//                                                Text("Category Summary")
//                                            } label: {
//                                                HStack {
//                                                    Text(category.name)
//                                                    Spacer()
//                                                    Text(String(category.budgetAmount ?? 0))
//                                                }
//                                                .listRowInsets(.none)
//                                            }
//                                        }
//                                    }
//                                },
//                                label: {
//                                    NavigationLink {
//                                        Text(budget.title)
//                                    } label: {
//                                        HStack {
//                                            Text(budget.title)
//                                            Spacer()
//                                        }
//                                    }
//                                }
//                            )
                        }
//                        .onDelete { indexs in
//                            print("Deleting")
//                        }
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            self.create = true
                        } label: {
                            FloatingButton()
                        }
                        .padding(.horizontal,32)
                        .padding(.vertical,16)
                    }
                }
            }
            .sheet(isPresented: self.$create, onDismiss: {
                self.viewModel.initialize(modelContext: self.context)
            }, content: {
                BudgetCreateView(isPresented: self.$create)
            })
            .navigationTitle("Budgets")
            .onAppear {
                self.viewModel.initialize(modelContext: self.context)
            }
        }
    }
}

#Preview {
    BudgetView()
}
