//
//  WalletRemoteDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

//import Foundation
//import FirebaseFirestoreSwift
//import Firebase
//
//class WalletRemoteDataSourceImpl: WalletRemoteDataSource {
//    
//    private let userRemoteDataSource: UserRemoteDataSource
//    private let dateProvider: DateProvider
//    
//    init(userRemoteDataSource: UserRemoteDataSource, dateProvider: DateProvider) {
//        self.userRemoteDataSource = userRemoteDataSource
//        self.dateProvider = dateProvider
//    }
//
//    func getContainers() async -> Result<[Wallet], Error> {
//        var wallets: [Wallet] = []
//        let user  = userRemoteDataSource.currentUser()
//        if let id: String = user?.id {
//            let reference = FirestoreDataBase.database.collection("users").document(id).collection("wallets")
//            do {
//                let query = try await reference.getDocuments()
//                for document in query.documents {
//                    let remoteEntity = try document.data(as: WalletRemoteEntity.self)
//                    var wallet = WalletRemoteEntityMapper().toTransactionContainer(remoteEntity: remoteEntity)
//                    wallets.append(wallet)
//                }
//                return Result.success(wallets)
//            } catch {
//                print(error.localizedDescription)
//                return Result.failure(error)
//            }
//        }
//        return Result.failure(NSError())
//    }
//    
//    func createDataBase(for user: User) {
//        
//    }
//    
//    func createContainer(container: Wallet, user: User) -> Bool {
//        let entity = WalletRemoteEntityMapper().toRemoteEntity(object: container)
//        let entityId: String = entity.id!
//        do {
//            try FirestoreDataBase.database.collection("users").document(user.id).collection("wallets").document(entityId).setData(from: container)
//            return true
//        } catch {
//            return false
//        }
//    }
//    
//    private func getTransactions(from document: DocumentSnapshot, container: Wallet) async -> [Transaction] {
//        do {
//            var transactions: [Transaction] = []
//            let query = try await document.reference.collection("transactions").getDocuments()
//            for transaction in query.documents {
//                let entity = try transaction.data(as: TransactionRemoteEntity.self)
//                transactions.append(TransactionRemoteEntityMapper().toTransaction(remoteEntity: entity))
//            }
//            return transactions
//        } catch {
//            return []
//        }
//    }
//    
//    private func getScheduledTransactions(from document: DocumentSnapshot, container: Wallet) async -> [ScheduledTransaction] {
//        do {
//            var transactions: [ScheduledTransaction] = []
//            let query = try await document.reference.collection("scheduleTransactions").getDocuments()
//            for transaction in query.documents {
//                let entity = try transaction.data(as: ScheduledTransactionRemoteEntity.self)
//                transactions.append(ScheduledTransactionRemoteEntityMapper().toScheduledTransaction(remoteEntity: entity))
//            }
//            return transactions
//        } catch {
//            return []
//        }
//    }
//}
