//
//  CreateTransactionContainer.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import SwiftUI

struct CreateTransactionContainer: View {
    
    var viewModel: CreateTransactionContainerViewModel = CreateTransactionContainerViewModel(createTransactionContainerInteractor: CreateTransactionContainerInteractorImpl(userRemoteDataSource: UserRemoteDataSourceImpl(), transactionContainerRemoteDataSource: TransactionsContainerRemoteDataSourceImpl()))
    
    @State var title: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Wallet name", text: self.$title)
                }
                
                Section {
                    Button {
                        self.viewModel.create(title: self.title)
                    } label: {
                        Text("Save")
                    }
                }
            }.navigationTitle("New Wallet")
        }

    }
}

struct CreateTransactionContainer_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionContainer()
    }
}
