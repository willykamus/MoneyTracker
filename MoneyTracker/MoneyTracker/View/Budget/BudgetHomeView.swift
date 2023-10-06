//
//  BudgetHomeView.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-08-27.
//

import SwiftUI
import Charts

struct BudgetHomeView: View {
    
    @ObservedObject var budgetViewModel = BudgetHomeViewModel()
    @State var selectedType: BudgetCategoryType = .none
    @State var presentBudgetCategorySelection: Bool = false
    
    var body: some View {
        NavigationView {
            
            List {
                Section {
                    VStack(spacing: 10) {
                        if budgetViewModel.budgetConfiguration.incomeCategories.count > 0 {
                            Chart($budgetViewModel.budgetConfiguration.incomeCategories, id: \.id) { category in
                                BarMark(
                                    x: .value("Amount", Int(category.wrappedValue.amount) ?? 0),
                                    stacking: .normalized
                                    )
                                .foregroundStyle(by: .value("Name", category.wrappedValue.category.name))
                            }
                            .chartXAxis(.hidden)
                        }
                        
                        ForEach($budgetViewModel.budgetConfiguration.incomeCategories, id: \.id) { $category in
                            BudgetConfigurationRowView(budgetCategory: $category)
                        }
                    }.padding()
                    
                } header: {
                    HStack {
                        Text("Income")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        NavigationLink {
                            BudgetCategorySelectionView(budget: $budgetViewModel.budgetConfiguration, budgetType: .income)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                
                Section {
                    VStack(spacing: 10) {
                        if budgetViewModel.budgetConfiguration.needCategories.count > 0 {
                            Chart($budgetViewModel.budgetConfiguration.needCategories, id: \.id) { category in
                                BarMark(
                                    x: .value("Amount", Int(category.wrappedValue.amount) ?? 0),
                                    stacking: .standard
                                    )
                                .foregroundStyle(by: .value("Name", category.wrappedValue.category.name))
                            }
                            .chartXAxis(.hidden)
                        }
                        
                        ForEach($budgetViewModel.budgetConfiguration.needCategories, id: \.id) { $category in
                            BudgetConfigurationRowView(budgetCategory: $category)
                        }
                    }.padding()
                } header: {
                    HStack {
                        Text("Need")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        NavigationLink {
                            BudgetCategorySelectionView(budget: $budgetViewModel.budgetConfiguration, budgetType: .need)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                
                Section {
                    VStack(spacing: 10) {
                        if budgetViewModel.budgetConfiguration.wantCategories.count > 0 {
                            Chart($budgetViewModel.budgetConfiguration.wantCategories, id: \.id) { category in
                                BarMark(
                                    x: .value("Amount", Int(category.wrappedValue.amount) ?? 0),
                                    stacking: .standard
                                    )
                                .foregroundStyle(by: .value("Name", category.wrappedValue.category.name))
                            }
                            .chartXAxis(.hidden)
                        }
                        
                        ForEach($budgetViewModel.budgetConfiguration.wantCategories, id: \.id) { $category in
                            BudgetConfigurationRowView(budgetCategory: $category)
                        }
                    }.padding()
                } header: {
                    HStack {
                        Text("Want")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        NavigationLink {
                            BudgetCategorySelectionView(budget: $budgetViewModel.budgetConfiguration, budgetType: .want)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
                
                Section {
                    VStack(spacing: 10) {
                        if budgetViewModel.budgetConfiguration.savingCategories.count > 0 {
                            Chart($budgetViewModel.budgetConfiguration.savingCategories, id: \.id) { category in
                                BarMark(
                                    x: .value("Amount", Int(category.wrappedValue.amount) ?? 0),
                                    stacking: .normalized
                                    )
                                .foregroundStyle(by: .value("Name", category.wrappedValue.category.name))
                            }
                            .chartXAxis(.hidden)
                        }
                        
                        ForEach($budgetViewModel.budgetConfiguration.savingCategories, id: \.id) { $category in
                            BudgetConfigurationRowView(budgetCategory: $category)
                        }
                    }.padding()
                } header: {
                    HStack {
                        Text("Saving")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        NavigationLink {
                            BudgetCategorySelectionView(budget: $budgetViewModel.budgetConfiguration, budgetType: .saving)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                    }
                }
            }
            .toolbar(.hidden)

        }
        .task {
            await budgetViewModel.createBudgetConfig()
        }

    }
}

struct BudgetHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetHomeView()
    }
}
