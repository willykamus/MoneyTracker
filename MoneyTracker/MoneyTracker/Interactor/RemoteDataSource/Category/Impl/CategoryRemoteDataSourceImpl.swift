//
//  CategoryRemoteDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-09-09.
//

//import Foundation
//import Firebase
//
//class CategoryRemoteDataSourceImpl: CategoryRemoteDataSource {
//    
//    let dataBase = FirestoreDataBase.database
//    
//    func getCategories() async -> Result<[Category],Error> {
//        do {
//            let query = try await FirestoreDataBase.database.collection("categories").getDocuments()
//            var categories: [Category] = []
//            for document in query.documents {
//                let entity = try document.data(as: CategoryRemoteEntity.self)
//                let model = CategoryRemoteEntityMapper().toCategory(entity)
//                categories.append(model)
//            }
//            return Result.success(categories)
//        } catch {
//            return Result.failure(error)
//        }
//    }
//    
//    func set(budgetId: String, categoryId: String) {
//        let docRef = dataBase.collection("categories").document(categoryId)
//        // Create a map of field paths to new values
//        let dataToUpdate = ["budget": budgetId]
//        docRef.updateData(dataToUpdate) { error in
//            if let error = error {
//                print("Error updating document: \(error)")
//            } else {
//                print("Document successfully updated")
//            }
//        }
//    }
//}
