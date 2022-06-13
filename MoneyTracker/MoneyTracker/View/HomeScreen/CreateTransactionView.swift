//
//  CreateTransactionView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import SwiftUI

struct CreateTransactionView: View {
    
    @Binding var createTransactionOpened: Bool
    
    @State var amount: String = ""
    @State var selectedDate: Date = Date()
    @State var selectedContainer: TransactionsContainer?
    @State var transactionContainersPresented: Bool = false
    @StateObject var viewModel: CreateTransactionViewModel = CreateTransactionViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Amount")) {
                    TextField("Amount", text: self.$viewModel.amount)
//                        .onChange(of: self.amount, perform: { value in
//                        self.viewModel.validateInputData(container: self.selectedContainer, category: self.selectedCategory, amount: value)
//                    })
                }
                
                Section(header: Text("Date")) {
                    DatePicker("Date", selection: self.$viewModel.selectedDate, displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                Section(header: Text("Wallet")) {
                    NavigationLink(
                        destination: AvailableTransactionContainersView(selectedContainer: self.$selectedContainer, containerListPresented: self.$transactionContainersPresented),
                        isActive: self.$transactionContainersPresented,
                        label: {
                            HStack {
                                Text("Wallet")
                                Spacer()
                                Text(self.selectedContainer?.name ?? "").foregroundColor(.gray)
                            }
                        })
                }
                
                Section {
                    Button {
                        print("Saving")
                    } label: {
                        Text("Save")
                    }

                }
            }
            .navigationTitle("Create a transaction")
        }
    }
}

struct CreateTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionView(createTransactionOpened: .constant(true))
    }
}
