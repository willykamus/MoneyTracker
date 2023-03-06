//
//  TransactionListView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import SwiftUI

struct TransactionListView: View {
    @Namespace private var animation
    @State var createTransactionOpened: Bool = false
    @StateObject var viewModel = TransactionsListViewModel()
    @State var transactionsContainer: TransactionsContainer
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    HStack {
                        Menu {
                            ForEach(self.viewModel.transactionsDisplayOptionAvailable, id: \.self) { transactionsDisplayOption in
                                Button(action: { self.viewModel.changeTransactionsDisplayOption(transactionsDisplayOption: transactionsDisplayOption)}, label: { Text(transactionsDisplayOption.rawValue) })
                            }
                        } label: {
                            Text(self.viewModel.transactionsDisplayOptionTitle)
                                .transaction { transaction in  transaction.animation = .none }
                        }
                        
                        if self.viewModel.transactionsDisplayOption == .byMonth {
                            Menu {
                                ForEach(1...12, id: \.self) { int in
                                    Button {
                                        self.viewModel.selectMonth(month: int)
                                    } label: {
                                        Text(self.viewModel.getMonthString(value: int))
                                    }
                                }
                            } label : {
                                Text(self.viewModel.selectedMonthString)
                                    .transition(AnyTransition.slide.animation(.linear(duration:1.0)))
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(.white)
                    .clipShape(Capsule())
                    .transition(AnyTransition.slide.animation(.linear(duration:1.0)))

                    Spacer()
                }.padding(.bottom, 16)
                
                List {
                    if self.transactionsContainer.scheduledTransactions?.count ?? 0 > 0 {
                        Section {
                            NavigationLink {
                                Text("Schedules transactions")
                            } label: {
                                Text("Schedules transactions")
                            }

                        }
                    }
                    if !viewModel.sections.isEmpty {
                        ForEach(viewModel.sections, id: \.self) { section in
                            Section(section.title) {
                                ForEach(section.transactions, id: \.self) { transaction in
                                    TransactionRowView(transaction: transaction)
                                }
                            }
                        }
                    } else {
                        ForEach(viewModel.transactions, id: \.self) { transaction in
                            TransactionRowView(transaction: transaction)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button { self.viewModel.sortByType() } label: { Text("Transaction type") }
                            Button { self.viewModel.sortByDate() } label: { Text("Date") }
                            Button { self.viewModel.sortByCategories() } label: { Text("Categories") }
                        } label: {
                            Button { } label: {
                                Label("Sort", systemImage:"arrow.up.arrow.down")
                                    .labelStyle(.titleAndIcon)
                            }
                        }
                    }
                })
                .onAppear {
                    Task {
                        await self.viewModel.getTransactions(container: self.transactionsContainer)
                    }
                }
                .onChange(of: self.createTransactionOpened) { value in
                    if !value {
                        Task {
                            await self.viewModel.getTransactions(container: self.transactionsContainer)
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            
            
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
        TransactionListView(transactionsContainer: TransactionsContainer(id: "", transactions: [], name: ""))
    }
}
