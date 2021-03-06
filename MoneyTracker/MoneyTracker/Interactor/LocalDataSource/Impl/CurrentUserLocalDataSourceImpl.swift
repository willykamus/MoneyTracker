//
//  CurrentUserLocalDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-06.
//

import Foundation

class CurrentUserLocalDataSourceImpl: CurrentUserLocalDataSource {
    
    let defaults = UserDefaults.standard
    
    func save(user: User) {
        defaults.set(user.id, forKey: User.CodingKeys.id.rawValue)
        defaults.set(user.password, forKey: User.CodingKeys.password.rawValue)
        defaults.set(user.email, forKey: User.CodingKeys.email.rawValue)
        defaults.synchronize()
    }
    
    func get() -> User {
        if let id: String = defaults.value(forKey: User.CodingKeys.id.rawValue) as? String, let password: String = defaults.value(forKey: User.CodingKeys.password.rawValue) as? String, let email: String = defaults.value(forKey: User.CodingKeys.email.rawValue) as? String {
            let user = User(id: id, email: email, password: password)
            return user
        }
        return User(id: "", email: "", password: "")
    }
}
