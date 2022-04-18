//
//  LoginViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-05.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var goToHomeScreen: Bool = false
    
    private var authenticateInteractor: AuthenticateUserInteractor = AuthenticateUserInteractorImpl(remoteDataSource: UserRemoteDataSourceImpl(), currentUserLocalDataSource: CurrentUserLocalDataSourceImpl())
    
    func authenticate() async {
        if !email.isEmpty && !password.isEmpty {
            let response = await authenticateInteractor.execute(email: email, password: password)
            switch response {
            case .success(let remoteResponse):
                if remoteResponse {
                    DispatchQueue.main.async {
                        self.goToHomeScreen = remoteResponse
                    }
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
}
