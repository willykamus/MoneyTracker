//
//  DeleteScheduledTransactionInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-26.
//

import Foundation

protocol DeleteScheduledTransactionInteractor {
    func execute(scheduledTransactions: [ScheduledTransaction]) async
}
