//
//  LoginView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-05.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Log In")
            VStack {
                TextField("Username", text: self.$viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password", text: self.$viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    Task.init {
                        await self.viewModel.authenticate()
                    }
                } label: {
                    HStack {
                        Text("Log in")
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                }

            }
            .padding()
            .fullScreenCover(isPresented: $viewModel.goToHomeScreen) {
                CreateTransactionContainer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
