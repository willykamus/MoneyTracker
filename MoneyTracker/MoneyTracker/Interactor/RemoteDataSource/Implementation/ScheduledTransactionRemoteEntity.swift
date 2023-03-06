//
//  ScheduledTransactionRemoteEntity.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-02-23.
//

import Foundation
import FirebaseFirestoreSwift

struct ScheduledTransactionRemoteEntity: Codable {
    @DocumentID public var id: String?
    var amount: Double
    var category: String
    var nextDate: Date
    var endDate: Date?
    var containerId: String?
    var type: String = ""
    var recurrence: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case amount
        case nextDate
        case endDate
        case containerId
        case type
        case recurrence
    }
}
