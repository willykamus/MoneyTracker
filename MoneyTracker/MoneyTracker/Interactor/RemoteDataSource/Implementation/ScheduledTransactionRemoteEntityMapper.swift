//
//  ScheduledTransactionRemoteEntityMapper.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-23.
//

import Foundation

class ScheduledTransactionRemoteEntityMapper {
    
    func toScheduledTransaction(remoteEntity: ScheduledTransactionRemoteEntity) -> ScheduledTransaction {
        let id = remoteEntity.id ??  UUID().uuidString
        return ScheduledTransaction(id: id, transaction: Transaction(id: id, amount: remoteEntity.amount, category: remoteEntity.category, date: remoteEntity.nextDate, containerId: remoteEntity.containerId, containerName: remoteEntity.containerName, type: self.type(value: remoteEntity.type)), recurrence: Recurrence(rawValue: remoteEntity.recurrence) ?? .never)
    }
    
    func toRemoteEntity(scheduledTransaction: ScheduledTransaction) -> ScheduledTransactionRemoteEntity {
        return ScheduledTransactionRemoteEntity(id: scheduledTransaction.id, amount: scheduledTransaction.transaction.amount, category: scheduledTransaction.transaction.category, nextDate: scheduledTransaction.nextDate(), endDate: scheduledTransaction.endDate, containerId: scheduledTransaction.transaction.containerId, containerName: scheduledTransaction.transaction.containerName, type: scheduledTransaction.transaction.type.rawValue, recurrence: scheduledTransaction.recurrence.rawValue)
    }
    
    func type(value: String) -> TransactionType {
        return TransactionType(rawValue: value) ?? .expense
    }
}
