//
//  SaveTransactionInteractorImplMock.swift
//  MoneyTrackerTests
//
//  Created by William Ching on 2023-06-06.
//

import Foundation
@testable import MoneyTracker

class SaveTransactionInteractorMock: SaveTransactionInteractor {
    var executCalled: Bool = false
    var executeCallCount: Int = 0
    func execute(transaction: MoneyTracker.Transaction, container: MoneyTracker.TransactionsContainer) async {
        executCalled = true
        executeCallCount += executeCallCount
    }
}
