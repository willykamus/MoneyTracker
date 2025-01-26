//
//  BudgetRemoteEntity.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-06-08.
//

import Foundation

import FirebaseFirestoreSwift

struct BudgetRemoteEntity: Codable {
    @DocumentID var id: String?
    var title: String
    var categories: [BudgetCategoryRemoteEntity]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case categories
    }
}

struct BudgetCategoryRemoteEntity: Codable {
    @DocumentID var id: String?
    var amount: Double
    var categoryId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case amount
        case categoryId
    }
}
