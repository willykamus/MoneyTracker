//
//  TransactionRemoteDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-12.
//

import Foundation

class TransactionRemoteDataSourceImpl: TransactionRemoteDataSource {

    let dataBase = FirestoreDataBase.database
    private let dateProvider: DateProvider
    private let userRemoteDataSource: UserRemoteDataSource
    
    init(dateProvider: DateProvider, userRemoteDataSource: UserRemoteDataSource) {
        self.dateProvider = dateProvider
        self.userRemoteDataSource = userRemoteDataSource
    }
    
    func add(transaction: Transaction, containerId: String, userId: String) async {
        let remoteEntity = TransactionRemoteEntityMapper().toRemoteEntity(transaction: transaction)
        let reference = dataBase.collection("users").document(userId).collection("transactionsContainers").document(containerId).collection("transactions")
        do {
            _ = try reference.addDocument(from: remoteEntity)

        } catch {

        }
    }
    
    func add(scheduleTransaction: ScheduledTransaction, containerId: String, userId: String) async {
        let remoteEntity = ScheduledTransactionRemoteEntityMapper().toRemoteEntity(scheduledTransaction: scheduleTransaction)
        let reference = dataBase.collection("users").document(userId).collection("transactionsContainers").document(containerId).collection("scheduleTransactions")
        do {
            _ = try reference.addDocument(from: remoteEntity)
        } catch {
            print("I am here")
        }
    }
    
    func delete(transaction: Transaction) async {
        
    }
    
    func delete(scheduleTransactionId: String, containerId: String, userId: String) async {
        do {
            try await dataBase.collection("users").document(userId).collection("transactionsContainers").document(containerId).collection("scheduleTransactions").document(scheduleTransactionId).delete()
        } catch {
            
        }
    }
    
    func getTransactions(containerId: String, userId: String) async -> [Transaction] {
        let reference = dataBase.collection("users").document(userId).collection("transactionsContainers").document(containerId).collection("transactions")
        do {
            let query = try await reference.getDocuments()
            var transactions: [Transaction] = []
            for transaction in query.documents {
                let entity = try transaction.data(as: TransactionRemoteEntity.self)
                transactions.append(TransactionRemoteEntityMapper().toTransaction(remoteEntity: entity))
            }
            return transactions
        } catch {
            return []
        }
    }
    
    func getAllTransactions() async -> [Transaction] {
        return []
    }
    
    func update(container: TransactionsContainer) async {
        guard let userId = userRemoteDataSource.currentUser()?.id else {
            return
        }
        let currentScheduledTransaction: [ScheduledTransaction] = container.scheduledTransactions ?? []
        var ids = transactions(currentScheduledTransaction: currentScheduledTransaction)
        for scheduledTransaction in currentScheduledTransaction {
            if Calendar.current.isDate(scheduledTransaction.nextDate(), inSameDayAs: dateProvider.nowAsDate()) || scheduledTransaction.nextDate() < dateProvider.nowAsDate() {
                ids.remove(at: ids.firstIndex(where: { $0.0 == scheduledTransaction.id })!)
                await self.delete(scheduleTransactionId: scheduledTransaction.id, containerId: container.id, userId: userId)
                await self.add(transaction: scheduledTransaction.transaction, containerId: container.id, userId: userId)
                if !ids.contains(where: { $0.1 == scheduledTransaction.transaction.id}) {
                    //Create new schedule
                }
            }
        }
    }
    
    private func transactions(currentScheduledTransaction: [ScheduledTransaction]) -> [(String, String)] {
        return currentScheduledTransaction.map { ($0.id,$0.transaction.id) }
    }
}
