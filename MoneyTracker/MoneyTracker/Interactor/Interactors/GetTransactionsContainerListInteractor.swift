//
//  GetTransactionsContainerListInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation

protocol GetTransactionsContainerListInteractor {
    func execute() async -> [TransactionsContainer]
}
