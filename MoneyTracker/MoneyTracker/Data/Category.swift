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
}
