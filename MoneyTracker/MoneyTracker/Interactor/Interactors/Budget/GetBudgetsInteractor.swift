//
//  GetBudgetsInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-09.
//

import Foundation

protocol GetBudgetsInteractor {
    func execute() async -> [Budget]
}
