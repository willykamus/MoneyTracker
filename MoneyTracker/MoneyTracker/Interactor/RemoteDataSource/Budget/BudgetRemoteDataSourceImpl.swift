//
//  BudgetRemoteDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-08.
//

//import Foundation
//import FirebaseFirestoreSwift
//
//class BudgetRemoteDataSourceImpl: BudgetRemoteDataSource {
//    func get() async -> Result<[Budget], Error> {
//        if let user = userRemoteDataSource.currentUser() {
//            let reference = dataBase.collection("users").document(user.id).collection("budget")
//            var budgets: [Budget] = []
//            do {
//                let query = try await reference.getDocuments()
//                for document in query.documents {
//                    let entity = try document.data(as: BudgetRemoteEntity.self)
//                    budgets.append(Budget(id: entity.id!, title: entity.title, categories: []))
//                    let categories = try await reference.document(entity.id!).collection("categories").getDocuments()
//                    var budgetCategories: [Category] = []
//                    for catetory in categories.documents {
//                        let entity = try catetory.data(as: BudgetCategoryRemoteEntity.self)
//                    }
//                }
//                return Result.success(budgets)
//            } catch {
//                print("Error getting budgets: \(error)")
//
//                return Result.failure(error)
//            }
//        }
//        return Result.failure(NSError())
//    }
//    
//    
//    let userRemoteDataSource: UserRemoteDataSource = UserRemoteDataSourceImpl()
//    let dataBase = FirestoreDataBase.database
//    
//    func save(budget: Budget) {
//        let user = userRemoteDataSource.currentUser()
//        let reference = dataBase.collection("users").document(user!.id).collection("budget").document(budget.id)
//        reference.setData([
//            "title": budget.title,
//        ]) { error in
//            if let error = error {
//                
//            } else {
//                print("Document successfully created")
//            }
//        }
//    }
//}
