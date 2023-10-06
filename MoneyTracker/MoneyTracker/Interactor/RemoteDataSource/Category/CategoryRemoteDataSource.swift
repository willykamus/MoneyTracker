//
//  CategoryRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol CategoryRemoteDataSource {
    func getCategories() async -> Result<[Category],Error>
    func save(categories: [Category]) async
}
