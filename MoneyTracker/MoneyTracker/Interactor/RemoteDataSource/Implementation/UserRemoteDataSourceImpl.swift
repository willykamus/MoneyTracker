//
//  UserRemoteDataSourceImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-05.
//

import Foundation
import Firebase

class UserRemoteDataSourceImpl: UserRemoteDataSource {
    
    func save(email: String, password: String) async -> Result<User, Error> {
        do {
            let userData = try await Auth.auth().createUser(withEmail: email, password: password)
            return .success(User(id: userData.user.uid, email: email, password: password))
        } catch {
            return .failure(error)
        }
    }
    
    func authenticate(email: String, password: String) async -> Result<User, Error> {
        do {
            let userData = try await Auth.auth().signIn(withEmail: email, password: password)
            return .success(User(id: userData.user.uid, email: email, password: password))
        } catch {
            return .failure(error)
        }
    }
    
    
}
