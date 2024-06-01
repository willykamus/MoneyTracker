//
//  GetWalletListInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation

class GetWalletListInteractorImpl: GetWalletListInteractor {
    
    private let transactionContainerRemoteDataSource: WalletRemoteDataSource = WalletRemoteDataSourceImpl(userRemoteDataSource: UserRemoteDataSourceImpl(), dateProvider: DateProviderImpl())
//    private let updateScheduledTransactionsInteractor: UpdateScheduledTransactionsInteractor = UpdateScheduledTransactionsInteractorImpl()
    
    func execute() async -> [Wallet] {
        let result = await transactionContainerRemoteDataSource.getContainers()
        switch result {
        case .success(let wallets):
            return wallets
        case .failure(let error):
            return []
        }
//        for container in containers {
//            await updateScheduledTransactionsInteractor.execute(container: container)
//        }
//        return await transactionContainerRemoteDataSource.getContainers()
    }
}
