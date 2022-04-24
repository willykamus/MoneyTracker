//
//  TransactionsContainerListViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation

class TransactionsContainerListViewModel: ObservableObject {
    
    @Published var transactionsContainer: [TransactionsContainer] = []
    
    private let getTransactionsContainerListInteractor: GetTransactionsContainerListInteractor = GetTransactionsContainerListInteractorImpl()
    
    func getContainers() async {
        let containers = await self.getTransactionsContainerListInteractor.execute()
        DispatchQueue.main.async {
            self.transactionsContainer = containers
        }
    }
    
}
