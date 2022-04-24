//
//  TransactionsContainerRemoteEntityMapper.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import Foundation

class TransactionsContainerRemoteEntityMapper {
    
    func toRemoteEntity(object: TransactionsContainer) -> TransactionsContainerRemoteEntity {
        return TransactionsContainerRemoteEntity(id: object.id, name: object.name)
    }
    
    func toTransactionContainer(remoteEntity: TransactionsContainerRemoteEntity) -> TransactionsContainer {
        return TransactionsContainer(id: remoteEntity.id ?? UUID().uuidString, transactions: nil, name: remoteEntity.name)
    }

}

