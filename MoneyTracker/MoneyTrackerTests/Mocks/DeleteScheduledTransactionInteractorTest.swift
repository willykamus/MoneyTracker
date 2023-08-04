//
//  DeleteScheduledTransactionInteractorTest.swift
//  MoneyTrackerTests
//
//  Created by William Ching on 2023-06-06.
//

import Foundation
@testable import MoneyTracker

class DeleteScheduledTransactionInteractorMock: DeleteScheduledTransactionInteractor {
    
    var executCalled: Bool = false
    var executeCallCount: Int = 0
    
    func execute(scheduledTransactions: [ScheduledTransaction]) async {
        executCalled = true
        executeCallCount += executeCallCount
    }
}
