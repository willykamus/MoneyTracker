//
//  CategoryRemoteEntity.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-09-09.
//

import Foundation
import FirebaseFirestoreSwift

struct CategoryRemoteEntity: Codable {
    @DocumentID var id: String?
    var name: String
    var type: String
    var budget: String?
}
