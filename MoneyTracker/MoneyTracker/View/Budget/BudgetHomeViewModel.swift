//
//  BudgetHomeViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-08-27.
//

import Foundation

class BudgetHomeViewModel: ObservableObject {
    
    @Published var budgetConfiguration: BudgetConfiguration = BudgetConfiguration(id: "", incomeCategories: [], needCategories: [], wantCategories: [], savingCategories: [])
    private let getCategoriesInteractor: GetCategoriesInteractor = GetCategoriesInteractorImpl()
    
    func createBudgetConfig() async {
        let result = await self.getCategoriesInteractor.execute()
        var budget = BudgetConfiguration(id: UUID().uuidString, incomeCategories: [], needCategories: [], wantCategories: [], savingCategories: [])
        switch result {
        case .success(let categories):
            DispatchQueue.main.async {
                self.budgetConfiguration = BudgetConfiguration(id: UUID().uuidString, incomeCategories: self.getIncome(categories: categories), needCategories: self.getNeed(categories: categories), wantCategories: self.getWant(categories: categories), savingCategories: self.getSaving(categories: categories))
            }
        case .failure(_): break

        }
    }
    
    private func getIncome(categories: [Category]) -> [BudgetCategory] {
        var incomes = categories.filter { $0.budgetCategoryType == .income }
        var incomeCategories: [BudgetCategory] = []
        for income in incomes {
            incomeCategories.append(BudgetCategory(category: income, amount: ""))
        }
        
        return incomeCategories
    }
    
    private func getNeed(categories: [Category]) -> [BudgetCategory] {
        var needs = categories.filter { $0.budgetCategoryType == .need }
        var needCategories: [BudgetCategory] = []
        for need in needs {
            needCategories.append(BudgetCategory(category: need, amount: ""))
        }
        
        return needCategories
    }
    
    private func getWant(categories: [Category]) -> [BudgetCategory] {
        var wants = categories.filter { $0.budgetCategoryType == .want }
        var wantCategories: [BudgetCategory] = []
        for want in wants {
            wantCategories.append(BudgetCategory(category: want, amount: ""))
        }
        
        return wantCategories
    }
    
    private func getSaving(categories: [Category]) -> [BudgetCategory] {
        var savings = categories.filter { $0.budgetCategoryType == .saving }
        var savingCategories: [BudgetCategory] = []
        for saving in savings {
            savingCategories.append(BudgetCategory(category: saving, amount: ""))
        }
        
        return savingCategories
    }
}
