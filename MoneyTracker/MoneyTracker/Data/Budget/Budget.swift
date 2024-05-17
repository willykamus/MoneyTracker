//
//  Budget.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import Foundation

struct Budget: Identifiable, Hashable, Codable {
    var id: String
    var title: String
    var categories: [BudgetCategory]
    
    func amount() -> Double {
        let amounts = categories.map { $0.amount }
        return amounts.reduce(into: 0) { partialResult, element in
            partialResult += element
        }
    }
}

struct BudgetCategory: Identifiable, Hashable, Codable {
    var id: String
    var category: Category
    var amount: Double
}
