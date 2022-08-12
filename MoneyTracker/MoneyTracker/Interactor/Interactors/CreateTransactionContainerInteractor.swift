//
//  CreateTransactionContainerInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import Foundation

protocol CreateTransactionContainerInteractor {
    func execute(title: String) -> Bool
}
