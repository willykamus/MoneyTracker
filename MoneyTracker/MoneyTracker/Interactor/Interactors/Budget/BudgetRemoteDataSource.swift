//
//  BudgetRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-08.
//

import Foundation

protocol BudgetRemoteDataSource {
    func save(budget: Budget)
    func get() async -> Result<[Budget], Error>
}
