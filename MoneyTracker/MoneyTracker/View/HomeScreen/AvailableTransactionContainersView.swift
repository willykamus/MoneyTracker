//
//  AvailableTransactionContainersView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-24.
//

//import SwiftUI
//
//struct AvailableTransactionContainersView: View {
//    
//    @Binding var selectedContainer: Wallet?
//    @Binding var containerListPresented: Bool
//    
//    @ObservedObject var viewModel: WalletListViewModel = WalletListViewModel()
//    
//    var body: some View {
//        
//        List (viewModel.Wallet) { Wallet in
//            Button {
//                self.selectedContainer = Wallet
//                self.containerListPresented.toggle()
//            } label: {
//                Text(Wallet.name)
//            }
//
//        }
//        .navigationBarTitleDisplayMode(.inline)
//        .task {
//            await viewModel.getContainers()
//        }
//    }
//}
//
//struct AvailableTransactionContainersView_Previews: PreviewProvider {
//    static var previews: some View {
//        AvailableTransactionContainersView(selectedContainer: .constant(nil), containerListPresented: .constant(true))
//    }
//}
