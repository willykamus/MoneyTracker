//
//  CreateWalletView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-08.
//

import SwiftUI

struct CreateWalletView: View {
    
    @Binding var walletCreated: Bool
    @ObservedObject var viewModel = CreateWalletViewModel(createTransactionContainerInteractor: CreateTransactionContainerInteractorImpl(userRemoteDataSource: UserRemoteDataSourceImpl(), transactionContainerRemoteDataSource: TransactionsContainerRemoteDataSourceImpl(userRemoteDataSource: UserRemoteDataSourceImpl(), dateProvider: DateProviderImpl())))
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("", text: self.$viewModel.name)
                }
                
                Section("Starting Amount") {
                    TextField("0$", text: self.$viewModel.startingAmount)
                }
                
                Button {
                    self.walletCreated = !self.viewModel.create()
                } label: {
                    Text("Save")
                }

            }
            .navigationTitle(Text("New wallet"))
            .alert("Not meeting requirements", isPresented: self.$viewModel.displayWarningMessage) {
                
            }
            
        }
    }
}

struct CreateWalletView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWalletView(walletCreated: .constant(true))
    }
}
