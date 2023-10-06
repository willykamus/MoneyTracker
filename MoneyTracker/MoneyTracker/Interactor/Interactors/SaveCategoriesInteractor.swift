//
//  SaveCategoriesInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-09-05.
//

import Foundation

protocol SaveCategoriesInteractor {
    func execute(categories: [Category]) async
}
