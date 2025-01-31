//
//  TransactionsMainView.swift
//  MoneyTracker
//
//  Created by William Ching on 2025-01-25.
//

import SwiftUI
import SwiftData

struct TransactionsMainView: View {
    @Environment(\.modelContext) private var context
    @StateObject var transactionsMainViewModel: TransactionsMainViewModel = TransactionsMainViewModel()
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if transactionsMainViewModel.transactionSection.isEmpty {
                    ContentUnavailableView("No transaction created", systemImage: "tray.fill")
                } else {
                    List {
                        ForEach($transactionsMainViewModel.transactionSection, id: \.self) { section in
                            Section {
                                ForEach(section.transactions, id: \.id) { transaction in
                                    TransactionsRowView(transaction: transaction.wrappedValue)
                                }
                            } header: {
                                Text(section.wrappedValue.date)
                                    
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            self.isPresented = true
                        } label: {
                            FloatingButton()
                        }
                        .padding(.horizontal,32)
                        .padding(.vertical,16)
                    }
                }
            }
            .onAppear {
                self.transactionsMainViewModel.getSections(context: self.context)
            }
            .sheet(isPresented: self.$isPresented, onDismiss: {
                
            }) {
                TransactionCreateVIew()
                    .presentationDetents([.large])

            }
        }
    }
}

#Preview {
    TransactionsMainView()
}
