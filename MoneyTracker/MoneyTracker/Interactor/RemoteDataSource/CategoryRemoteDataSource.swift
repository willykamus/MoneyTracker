//
//  CategoryRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol CategoryRemoteDataSource {
    func getCategories() async -> [Category]
    func getIncomeCategories(completed: @escaping (Result<[Category], Error>) -> Void)
    func getExpenseCategories(completed: @escaping (Result<[Category], Error>) -> Void)
}
