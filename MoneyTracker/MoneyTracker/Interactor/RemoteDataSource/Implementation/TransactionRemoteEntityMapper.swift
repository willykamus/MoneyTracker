//
//  TransactionRemoteEntityMapper.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation

class TransactionRemoteEntityMapper {
    func toTransaction(remoteEntity: TransactionRemoteEntity) -> Transaction {
        return Transaction(id: remoteEntity.id ??  UUID().uuidString, amount: remoteEntity.amount, category: remoteEntity.category, date: remoteEntity.date, containerId: remoteEntity.containerId!, containerName: remoteEntity.containerName, type: type(value: remoteEntity.type))
    }
    
    func toRemoteEntity(transaction: Transaction) -> TransactionRemoteEntity {
        return TransactionRemoteEntity(id: transaction.id, amount: transaction.amount, category: transaction.category, date: transaction.date, containerId: transaction.containerId, containerName: transaction.containerName, type: transaction.type.rawValue)
    }
    
    func type(value: String) -> TransactionType {
        return TransactionType(rawValue: value) ?? .expense
    }
}
