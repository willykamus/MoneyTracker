//
//  SaveTransactionInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-19.
//

import Foundation

protocol SaveTransactionInteractor {
    func execute(transaction: Transaction, container: TransactionsContainer) async
}
