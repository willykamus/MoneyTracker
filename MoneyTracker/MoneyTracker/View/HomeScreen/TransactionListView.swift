//
//  TransactionListView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import SwiftUI

struct TransactionListView: View {
    
    @State var createTransactionOpened: Bool = false
    @StateObject var viewModel = TransactionsListViewModel()
    @Binding var transactionsContainer: TransactionsContainer
    
    var body: some View {
        ZStack {
            
            List {
                ForEach(viewModel.transactions, id: \.self) { transaction in
                    HStack {
                        Text(String(transaction.category))
                        Spacer()
                        Text(String(transaction.amount))
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear {
                Task {
                    await self.viewModel.getTransactions(container: self.transactionsContainer)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.createTransactionOpened.toggle()
                    }, label: {
                        FloatingButton()
                    })
                }
                .padding(.bottom,20)
                .padding(.horizontal,20)
                
            }
            .sheet(isPresented: self.$createTransactionOpened) {
                print("Dismiss")
            } content: {
                CreateTransactionView(createTransactionOpened: self.$createTransactionOpened)
            }

        }
        
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(transactionsContainer: .constant(TransactionsContainer(id: "", transactions: [], name: "")))
    }
}
