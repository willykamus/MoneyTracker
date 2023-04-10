//
//  SaveScheduleTransaction.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-23.
//

import Foundation

protocol SaveScheduleTransactionInteractor {
    func execute(transaction: ScheduledTransaction, container: TransactionsContainer) async
}
