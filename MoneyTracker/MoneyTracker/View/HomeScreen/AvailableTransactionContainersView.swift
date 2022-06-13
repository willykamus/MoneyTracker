//
//  AvailableTransactionContainersView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import SwiftUI

struct AvailableTransactionContainersView: View {
    
    @Binding var selectedContainer: TransactionsContainer?
    @Binding var containerListPresented: Bool
    
    @ObservedObject var viewModel: TransactionsContainerListViewModel = TransactionsContainerListViewModel()
    
    var body: some View {
        
        List (viewModel.transactionsContainer) { transactionsContainer in
            Button {
                self.selectedContainer = transactionsContainer
                self.containerListPresented.toggle()
            } label: {
                Text(transactionsContainer.name)
            }

        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getContainers()
        }
    }
}

struct AvailableTransactionContainersView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableTransactionContainersView(selectedContainer: .constant(nil), containerListPresented: .constant(true))
    }
}
