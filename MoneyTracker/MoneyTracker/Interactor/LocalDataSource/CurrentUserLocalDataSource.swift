//
//  CurrentUserLocalDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-06.
//

import Foundation

protocol CurrentUserLocalDataSource {
    func save(user: User)
    func get() -> User
}
