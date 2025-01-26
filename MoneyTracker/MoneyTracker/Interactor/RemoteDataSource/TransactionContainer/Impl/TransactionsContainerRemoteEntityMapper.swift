//
//  WalletRemoteEntityMapper.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import Foundation

class WalletRemoteEntityMapper {
    
    func toRemoteEntity(object: Wallet) -> WalletRemoteEntity {
        return WalletRemoteEntity(id: object.id, name: object.name)
    }
    
    func toTransactionContainer(remoteEntity: WalletRemoteEntity) -> Wallet {
        return Wallet(id: remoteEntity.id ?? UUID().uuidString, transactions: [], scheduledTransactions: [], name: remoteEntity.name)
    }

}

