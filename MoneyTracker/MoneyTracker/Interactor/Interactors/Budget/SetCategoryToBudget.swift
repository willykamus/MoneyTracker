//
//  SetCategoryToBudget.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-07.
//

import Foundation

protocol SetCategoryToBudgetInteractor {
    func execute(categoryId: String, budgetId: String)
}
