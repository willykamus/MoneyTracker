//
//  WalletsView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import SwiftUI

struct WalletsView: View {
    
    @ObservedObject var viewModel: TransactionsContainerListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.transactionsContainer) { transactionContainer in
                Section {
                    TransactionsContainerRow(transactionsContainer: transactionContainer)
                }
            }
        }
    }
}

struct WalletsView_Previews: PreviewProvider {
    static var previews: some View {
        WalletsView(viewModel: TransactionsContainerListViewModel())
    }
}
