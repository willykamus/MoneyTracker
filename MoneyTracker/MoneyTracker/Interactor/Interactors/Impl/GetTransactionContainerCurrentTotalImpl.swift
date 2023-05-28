//
//  GetTransactionContainerCurrentTotalImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-04-10.
//

import Foundation

class GetTransactionContainerCurrentTotalImpl: GetTransactionContainerCurrentTotal {
    func execute(transactionsContainer: TransactionsContainer) -> Double {
        let expenses: [Transaction] = transactionsContainer.transactions!.filter({ $0.type == .expense })
        let incomes: [Transaction] = transactionsContainer.transactions!.filter({ $0.type == .income })
        let expensesTotal: Double = expenses.sum(for: \.amount)
        let incomesTotal: Double = incomes.sum(for: \.amount)
        return incomesTotal - expensesTotal
    }
}

extension Sequence {
    func sum<T: Numeric>(for keyPath: KeyPath<Element, T>) -> T {
        return reduce(0) { sum, element in
            sum + element[keyPath: keyPath]
        }
    }
}
