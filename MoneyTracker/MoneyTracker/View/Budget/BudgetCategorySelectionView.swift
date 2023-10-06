//
//  BudgetCategorySelectionView.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-08-27.
//

import SwiftUI

struct BudgetCategorySelectionView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var budget: BudgetConfiguration
    var budgetType: BudgetCategoryType
    
    @ObservedObject var viewModel: BudgetCategorySelectionViewModel
    
    init(budget: Binding<BudgetConfiguration>, budgetType: BudgetCategoryType) {
        self._budget = budget
        self.budgetType = budgetType
        self.viewModel = BudgetCategorySelectionViewModel(budget: budget, budgetCategoryType: budgetType)
    }
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.selectedCategories.sorted { $0.name < $1.name }) { category in
                    Button {
                        self.viewModel.unSelectCategory(category: category)
                    } label: {
                        Text(category.name)
                    }
                }
            } header: {
                Text("Selected")
                    .task {
                        await viewModel.getAvailableCategories()
                    }
            }

            Section {
                ForEach(viewModel.unSelectedCategories.sorted { $0.name < $1.name }) { category in
                    Button {
                        self.viewModel.selectCategory(category: category)
                    } label: {
                        Text(category.name)
                    }
                }
            } header: {
                Text("Available")
            }
        }

        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                    
                    Task {
                        await self.viewModel.save()
                    }
                    
                } label: {
                    Text("Save")
                }

            }
        })
        
    }
}

struct BudgetCategorySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetCategorySelectionView(budget: .constant(BudgetConfiguration(id: "", incomeCategories: [], needCategories: [], wantCategories: [], savingCategories: [])), budgetType: .none)
    }
}
