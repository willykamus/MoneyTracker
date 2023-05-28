//
//  GetTransactionContainerFutureTotalImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-04-10.
//

import Foundation

class GetTransactionContainerFutureTotalImpl: GetTransactionContainerFutureTotal {
    func execute(transactionContainter: TransactionsContainer) -> Double {
        if let scheduledTransactions = transactionContainter.scheduledTransactions {
            let futureExpenses = scheduledTransactions.filter { $0.transaction.type == .expense }
            let futureIncomes = scheduledTransactions.filter { $0.transaction.type == .income }
            let futureExpensesTotal: Double = futureExpenses.sum(for: \.transaction.amount)
            let futureIncomesTotal: Double = futureIncomes.sum(for: \.transaction.amount)
            return futureIncomesTotal - futureExpensesTotal
        }
        return 0
    }
}
