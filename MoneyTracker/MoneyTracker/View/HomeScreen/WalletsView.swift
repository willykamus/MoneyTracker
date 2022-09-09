//
//  WalletsView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import SwiftUI

struct WalletsView: View {
    
    @ObservedObject var viewModel: TransactionsContainerListViewModel = TransactionsContainerListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if !viewModel.noContainerMessage.isEmpty {
                    VStack {
                        Text(viewModel.noContainerMessage)
                    }
                } else {
                    List {
                        ForEach(viewModel.transactionsContainer) { transactionContainer in
                            NavigationLink {
                                TransactionListView(transactionsContainer: .constant(transactionContainer))
                            } label: {
                                TransactionsContainerRow(transactionsContainer: transactionContainer)
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            self.viewModel.walletCreated.toggle()
                        } label: {
                            FloatingButton()
                        }
                        .padding(.horizontal,32)
                        .padding(.vertical,16)
                    }
                }
            }
            .navigationTitle("Wallets")
            .sheet(isPresented: self.$viewModel.walletCreated) {
                CreateWalletView(walletCreated: self.$viewModel.walletCreated)
            }
            
        }
    }
}

struct WalletsView_Previews: PreviewProvider {
    static var previews: some View {
        WalletsView(viewModel: TransactionsContainerListViewModel())
    }
}
