//
//  UpdateScheduledTransactionsInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-26.
//

import Foundation

protocol UpdateScheduledTransactionsInteractor {
    func execute(container: TransactionsContainer) async
}
