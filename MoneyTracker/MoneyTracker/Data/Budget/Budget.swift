//
//  Budget.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-04-10.
//

import Foundation
import SwiftData

@Model
class Budget {
    var id: String
    var title: String
    @Relationship(deleteRule: .deny, inverse: \Category.budget)
    var categories: [Category] = []
    var type: TransactionType
    
    init(id: String, title: String, categories: [Category], type: TransactionType) {
        self.id = id
        self.title = title
        self.categories = categories
        self.type = type
    }
    
    @Transient
    var amount: String {
        let sum = categories.map { $0.budgetAmount }.reduce(into: 0) { partialResult, element in
            partialResult += element ?? 0
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(for: sum) ?? ""
    }
}
