//
//  Transaction.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation
import SwiftData

@Model
class Transaction {
    var id: String = UUID().uuidString
    var category: Category
    var amount: Double
    var date: Date
    
    init(category: Category, amount: Double, date: Date) {
        self.amount = amount
        self.category = category
        self.date = date
    }
    
    @Transient
    var type: TransactionType {
        return self.category.type
    }
}
