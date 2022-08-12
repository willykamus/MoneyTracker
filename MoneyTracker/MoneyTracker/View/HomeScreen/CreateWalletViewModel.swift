//
//  CreateWalletViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-08.
//

import Foundation
import SwiftUI

class CreateWalletViewModel: ObservableObject {
    
    @Published var startingAmount: String = ""
    @Published var name: String = ""
    @Published var displayWarningMessage: Bool = false
    
    let createTransactionContainerInteractor: CreateTransactionContainerInteractor
    
    init(createTransactionContainerInteractor: CreateTransactionContainerInteractor) {
        self.createTransactionContainerInteractor = createTransactionContainerInteractor
    }
    
    func create() -> Bool {
        if !name.isEmpty {
            return self.createTransactionContainerInteractor.execute(title: self.name)
        }
        self.displayWarningMessage.toggle()
        return false
    }
}
