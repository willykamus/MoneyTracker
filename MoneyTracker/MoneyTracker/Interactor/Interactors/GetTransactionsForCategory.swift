//
//  GetTransactionsForCategory.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-17.
//

import Foundation

protocol GetTransactionsForCategory {
    func execute(category: Category) async -> Result<[Transaction], Error>
}
