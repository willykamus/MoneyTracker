//
//  TransactionRemoteEntity.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation
import FirebaseFirestoreSwift

struct TransactionRemoteEntity: Codable {
    @DocumentID public var id: String?
    var amount: Double
    var category: String
    var date: Date
    var containerId: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case amount
        case date
        case containerId
    }
}
