//
//  CreateTransactionContainerViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-18.
//

import Foundation

class CreateTransactionContainerViewModel {
    
    private var createTransactionContainerInteractor: CreateTransactionContainerInteractor
    
    init(createTransactionContainerInteractor: CreateTransactionContainerInteractor) {
        self.createTransactionContainerInteractor = createTransactionContainerInteractor
    }
    
    func create(title: String) {
        createTransactionContainerInteractor.execute(title: title)
    }
    
}
