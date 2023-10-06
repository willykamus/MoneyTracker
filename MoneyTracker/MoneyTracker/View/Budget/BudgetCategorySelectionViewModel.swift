//
//  BudgetCategorySelectionViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-08-27.
//

import Foundation
import SwiftUI

class BudgetCategorySelectionViewModel: ObservableObject {
    
    @Published var selectedCategories: Set<Category> = Set()
    @Published var unSelectedCategories: Set<Category> = Set()
    @Binding var budget: BudgetConfiguration
    private let currentBudgetCategoryType: BudgetCategoryType
    
    private let getCategoriesInteractor: GetCategoriesInteractor = GetCategoriesInteractorImpl()
    private let saveCategories: SaveCategoriesInteractor = SaveCategoriesInteractorImpl()
    
    init(budget: Binding<BudgetConfiguration>, budgetCategoryType: BudgetCategoryType) {
        self._budget = budget
        self.currentBudgetCategoryType = budgetCategoryType
    }
    
    func getAvailableCategories() async {
        DispatchQueue.main.async {
            switch self.currentBudgetCategoryType {
            case .income:
                self.selectedCategories = Set(self.budget.incomeCategories.map { $0.category } )
            case .need:
                self.selectedCategories = Set(self.budget.needCategories.map { $0.category } )
            case .want:
                self.selectedCategories = Set(self.budget.wantCategories.map { $0.category } )
            case .saving:
                self.selectedCategories = Set(self.budget.savingCategories.map { $0.category } )
            case .none:
                break
            }
        }
        
        let result = await getCategoriesInteractor.execute()
        switch result {
        case .success(let categories):
            let unSelectedCategories = categories.filter { $0.budgetCategoryType == .none }
            if currentBudgetCategoryType == .income || currentBudgetCategoryType == .saving {
                DispatchQueue.main.async {
                    let set = Set(unSelectedCategories.filter { $0.type == .income })
                    let newSet = set.subtracting(self.selectedCategories)
                    self.unSelectedCategories = newSet
                }
            } else {
                DispatchQueue.main.async {
                    let set = Set(unSelectedCategories.filter { $0.type == .expense })
                    let newSet = set.subtracting(self.selectedCategories)
                    self.unSelectedCategories = newSet
                }
            }
        case .failure(_):
            return
        }
    }
    
    func save() async {
        var categories: [BudgetCategory] = []
        for category in selectedCategories {
            categories.append(BudgetCategory(category: category, amount: ""))
        }
        switch currentBudgetCategoryType {
        case .income:
            self.budget.incomeCategories = categories
        case .need:
            self.budget.needCategories = categories
        case .want:
            self.budget.wantCategories = categories
        case .saving:
            self.budget.savingCategories = categories
        case .none:
            break
        }
        
        await self.saveCategories.execute(categories: Array(selectedCategories))
        await self.saveCategories.execute(categories: Array(unSelectedCategories))
    }
    
    func selectCategory(category: Category) {
        var modifiedCategory = category
        modifiedCategory.budgetCategoryType = currentBudgetCategoryType
        self.selectedCategories.insert(modifiedCategory)
        self.unSelectedCategories.remove(modifiedCategory)
    }
    
    func unSelectCategory(category: Category) {
        var modifiedCategory = category
        modifiedCategory.budgetCategoryType = .none
        self.selectedCategories.remove(modifiedCategory)
        self.unSelectedCategories.insert(modifiedCategory)
    }
}
