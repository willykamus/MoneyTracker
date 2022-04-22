//
//  TransactionsContainerRemoteDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import Foundation

class TransactionsContainerRemoteDataSourceImpl: TransactionsContainerRemoteDataSource {
    
    func getContainers() async -> [TransactionsContainer] {
        return []
    }
    
    func createDataBase(for user: User) {
        
    }
    
    func createContainer(container: TransactionsContainer, user: User) -> Bool {
        let entity = TransactionsContainerRemoteEntityMapper().toRemoteEntity(object: container)
        let entityId: String = entity.id!
        do {
            try FirestoreDataBase.database.collection("users").document(user.id).collection("transactionsContainers").document(entityId).setData(from: container)
            return true
        } catch {
            return false
        }
    }
}
