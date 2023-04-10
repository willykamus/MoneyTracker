//
//  GetTransactionContainerCurrentTotal.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-04-10.
//

import Foundation

protocol GetTransactionContainerCurrentTotal {
    func execute(transactionsContainer: TransactionsContainer) -> Double
}
