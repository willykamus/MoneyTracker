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
            Group {
                if !viewModel.noContainerMessage.isEmpty {
                    VStack {
                        Text(viewModel.noContainerMessage)
                    }
                } else {
                    List {
                        ForEach(viewModel.transactionsContainer) { transactionContainer in
                            Section {
                                NavigationLink {
                                    TransactionListView()
                                } label: {
                                    TransactionsContainerRow(transactionsContainer: transactionContainer)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Wallets")
            .task {
                await viewModel.getContainers()
            }
        }
    }
}

struct WalletsView_Previews: PreviewProvider {
    static var previews: some View {
        WalletsView(viewModel: TransactionsContainerListViewModel())
    }
}
