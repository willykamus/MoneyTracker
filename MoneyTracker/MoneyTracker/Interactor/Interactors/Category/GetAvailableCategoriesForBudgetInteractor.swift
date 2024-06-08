//
//  GetAvailableCategoriesForBudgetInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-02.
//

import Foundation

protocol GetAvailableCategoriesForBudgetInteractor {
    func execute() async -> [Category]
}
