//
//  CreateTransactionView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import SwiftUI

struct CreateTransactionView: View {
    
    @Binding var createTransactionOpened: Bool
    @State var transactionContainersPresented: Bool = false
    @State var selectedCategory: Category = Category(id: "", type: .income, name: "")
    @State var categoryListPresented: Bool = false
    @StateObject var viewModel: CreateTransactionViewModel = CreateTransactionViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Transaction Amount")) {
                    TextField("Amount", text: self.$viewModel.amount)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("Date", selection: self.$viewModel.selectedDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                Section(header: Text("Category")) {
                    NavigationLink(
                        destination: AvailableCategoriesView(selectedCategory: self.$selectedCategory, listPresented: self.$categoryListPresented, incomeCategories: self.$viewModel.incomeCategories, expenseCategories: self.$viewModel.expensesCategories),
                        isActive: self.$categoryListPresented,
                        label: {
                            HStack {
                                Text("Category")
                                Spacer()
                                Text(self.selectedCategory.name).foregroundColor(.gray)
                            }
                        })
                }
                .onAppear {
                    Task {
                        await self.viewModel.getCategories()
                    }
                }
                
                Section(header: Text("Wallet")) {
                    NavigationLink(
                        destination: AvailableTransactionContainersView(selectedContainer: self.$viewModel.selectedContainer, containerListPresented: self.$transactionContainersPresented),
                        isActive: self.$transactionContainersPresented,
                        label: {
                            HStack {
                                Text("Wallet")
                                Spacer()
                                Text(self.viewModel.selectedContainer?.name ?? "").foregroundColor(.gray)
                            }
                        })
                }
                
                Section {
                    Button {
                        Task {
                            self.createTransactionOpened = await !self.viewModel.save(category: self.selectedCategory)
                        }
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
