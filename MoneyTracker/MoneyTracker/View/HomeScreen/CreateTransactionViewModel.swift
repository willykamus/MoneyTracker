//
//  CreateTransactionViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

import Foundation

class CreateTransactionViewModel: ObservableObject {
    
    @Published var amount: String = ""
    @Published var selectedDate: Date = Date()
    @Published var inputsValidated: Bool = false
    
}
