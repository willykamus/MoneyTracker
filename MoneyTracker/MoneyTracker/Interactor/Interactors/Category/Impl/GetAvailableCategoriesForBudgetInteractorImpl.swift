//
//  GetAvailableCategoriesForBudgetInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-02.
//

import Foundation

class GetAvailableCategoriesForBudgetInteractorImpl: GetAvailableCategoriesForBudgetInteractor {
    private let categoryRemoteDataSource: CategoryRemoteDataSource = CategoryRemoteDataSourceImpl()
    
    func execute() async -> [Category] {
        let result = await categoryRemoteDataSource.getCategories()
        switch result {
        case .success(let categories):
            return categories.filter { $0.budget.isEmpty }
        default:
            return []
        }
        
    }
    
    
}
