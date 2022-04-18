//
//  User.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

struct User: Identifiable, Hashable {
    var id: String
    var email: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case password = "password"
    }
}
