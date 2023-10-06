//
//  Category.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

struct Category: Identifiable, Hashable {
    var id: String
    var type: TransactionType
    var name: String
    var budgetCategoryType: BudgetCategoryType
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum BudgetCategoryType: String {
    case income
    case need
    case want
    case saving
    case none
}
