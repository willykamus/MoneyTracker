//
//  UserRemoteDataSource.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import Foundation

protocol UserRemoteDataSource {
    func save(email: String, password: String) async -> Result<User,Error>
    func authenticate(email: String, password: String) async -> Result<User,Error>
    func currentUser() -> User?
}
