//
//  HomeScreenView.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import SwiftUI

struct HomeScreenView: View {
    
    var body: some View {
        TabView {
            WalletsView()
                .tabItem {
                    Label("Wallets", systemImage: "wallet.pass")
                }
            
            TransactionsView()
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet.rectangle.portrait")
                }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
