//
//  Category.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation
import SwiftData

@Model
class Category {
    var type: TransactionType
    var name: String
    var budget: Budget?
    var budgetAmount: Double?
    
    init(type: TransactionType, name: String, budget: Budget? = nil, budgetAmount: Double? = nil) {
        self.type = type
        self.name = name
        self.budget = budget
        self.budgetAmount = budgetAmount
    }
}
