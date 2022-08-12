//
//  TransactionsContainerListViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import Foundation

class TransactionsContainerListViewModel: ObservableObject {
    
    @Published var transactionsContainer: [TransactionsContainer] = []
    @Published var noContainerMessage: String = ""
    @Published var walletCreated: Bool = false
    
    private let getTransactionsContainerListInteractor: GetTransactionsContainerListInteractor = GetTransactionsContainerListInteractorImpl()
    
    init() {
        Task(priority: .medium) {
            await self.getContainers()
        }
    }
    func getContainers() async {
        let containers = await self.getTransactionsContainerListInteractor.execute()
        DispatchQueue.main.async {
            if containers.isEmpty {
                self.noContainerMessage = "Create a new wallet"
            } else {
                self.transactionsContainer = containers
            }
            
        }
    }
    
}
