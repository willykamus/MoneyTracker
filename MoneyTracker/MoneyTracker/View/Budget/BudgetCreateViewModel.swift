//
//  BudgetCreateViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-02.
//

import Foundation

class BudgetCreateViewModel: ObservableObject {
    @Published var availableCategories: [Category] = []
    
    private let getAvailableCategoriesForBudgetInteractor: GetAvailableCategoriesForBudgetInteractor = GetAvailableCategoriesForBudgetInteractorImpl()
    
    func getAvailableCategories() async -> [Category] {
        return await self.getAvailableCategoriesForBudgetInteractor.execute()
    }
}
