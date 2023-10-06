//
//  BudgetConfiguration.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-08-27.
//

import Foundation

struct BudgetConfiguration: Hashable {
    var id: String
    var incomeCategories: [BudgetCategory]
    var needCategories: [BudgetCategory]
    var wantCategories: [BudgetCategory]
    var savingCategories: [BudgetCategory]
}

struct BudgetCategory: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var category: Category
    var amount: String
}
