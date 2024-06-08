//
//  GetCategoriesInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-09-13.
//

import Foundation

protocol GetCategoriesInteractor {
    func execute() async -> Result<[Category],Error>
}
