//
//  TransactionRemoteDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-12.
//

import Foundation

class TransactionRemoteDataSourceImpl: TransactionRemoteDataSource {
    
    let dataBase = FirestoreDataBase.database
    
    func add(transaction: Transaction, containerId: String, userId: String) async -> Bool {
        let remoteEntity = TransactionRemoteEntityMapper().toRemoteEntity(transaction: transaction)
        let reference = dataBase.collection("users").document(userId).collection("transactionsContainers").document(containerId).collection("transactions")
        do {
            _ = try reference.addDocument(from: remoteEntity)
            return true
        } catch {
            return false
        }
    }
    
    func delete(transaction: Transaction) {
        
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
    
    
}