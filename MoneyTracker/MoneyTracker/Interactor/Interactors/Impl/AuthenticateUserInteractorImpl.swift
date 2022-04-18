//
//  AuthenticateUserInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-06.
//

import Foundation

class AuthenticateUserInteractorImpl: AuthenticateUserInteractor {
    
    var remoteDataSource: UserRemoteDataSource
    var currentUserLocalDataSource: CurrentUserLocalDataSource
    
    init(remoteDataSource: UserRemoteDataSource, currentUserLocalDataSource: CurrentUserLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.currentUserLocalDataSource = currentUserLocalDataSource
    }
    
    func execute(email: String, password: String) async -> Result<Bool, Error> {
        let result = await remoteDataSource.authenticate(email: email, password: password)
        switch result {
        case .success(let user):
            currentUserLocalDataSource.save(user: user)
            return .success(true)
        case .failure(let error):
            return .failure(error)
        }
    }
}
