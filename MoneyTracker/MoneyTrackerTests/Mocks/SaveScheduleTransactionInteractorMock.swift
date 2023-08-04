//
//  saveScheduleTransactionInteractorMock.swift
//  MoneyTrackerTests
//
//  Created by William Ching on 2023-06-10.
//

import Foundation
@testable import MoneyTracker

class SaveScheduleTransactionInteractorMock: SaveScheduleTransactionInteractor {
    var executCalled: Bool = false
    var executeCallCount: Int = 0
    func execute(transaction: MoneyTracker.ScheduledTransaction, container: MoneyTracker.TransactionsContainer) async {
        executCalled = true
        executeCallCount += executeCallCount
    }
    

}
