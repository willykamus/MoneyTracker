//
//  AuthenticateUserInteractor.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-06.
//

import Foundation

protocol AuthenticateUserInteractor {
    func execute(email: String, password: String) async -> Result<Bool, Error>
}
