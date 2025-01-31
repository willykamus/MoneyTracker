//
//  WalletListViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

//import Foundation
//
//class WalletListViewModel: ObservableObject {
//    
//    @Published var Wallet: [Wallet] = []
//    @Published var noContainerMessage: String = ""
//    @Published var walletCreated: Bool = false
//    
//    private let getWalletListInteractor: GetWalletListInteractor = GetWalletListInteractorImpl()
//    
//    init() {
//        Task(priority: .medium) {
//            await self.getContainers()
//        }
//    }
//    func getContainers() async {
//        let containers = await self.getWalletListInteractor.execute()
//        DispatchQueue.main.async {
//            if containers.isEmpty {
//                self.noContainerMessage = "Create a new wallet"
//            } else {
//                self.Wallet = containers
//            }
//            
//        }
//    }
//    
//}
