//
//  TransactionCreateVIew.swift
//  MoneyTracker
//
//  Created by William Ching on 2025-01-25.
//

import SwiftUI

struct TransactionCreateVIew: View {
    
    @Environment(\.modelContext) private var context

    @StateObject var transactionCreateViewModel: TransactionCreateViewModel = TransactionCreateViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Picker("Category", selection: self.$transactionCreateViewModel.category) {
                            ForEach(self.transactionCreateViewModel.categories, id: \.self) { category in
                                Text(category.name)
                            }
                        }.pickerStyle(.navigationLink)
                    }
                    
                    Section {
                        LabeledContent {
                            TextField("Amount", value: $transactionCreateViewModel.amount, format: .currency(code: "US"))
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.trailing)
                        } label: {
                            Text("Amount")
                        }
                    }
                    
                    Section {
                        DatePicker("Date", selection: self.$transactionCreateViewModel.date, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                    }
                    
                    Button {
                        self.transactionCreateViewModel.save()
                    } label: {
                        Text("Save")
                    }
                }
                .listSectionSpacing(.compact)
                .onAppear {
                    transactionCreateViewModel.getCategories(context: context)
                }
                .navigationTitle(Text("Transaction"))

                

            }
        }
        
    }
}

#Preview {
    TransactionCreateVIew()
}
