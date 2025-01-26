//
//  TransactionContainerRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol WalletRemoteDataSource {
    func getContainers() async -> Result<[Wallet], Error>
    func createDataBase(for user: User)
    func createContainer(container: Wallet, user: User) -> Bool
}
