//
//  GetTransactionContainerFutureTotal.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-04-10.
//

import Foundation

protocol GetTransactionContainerFutureTotal {
    func execute(transactionContainter: TransactionsContainer) -> Double
}
