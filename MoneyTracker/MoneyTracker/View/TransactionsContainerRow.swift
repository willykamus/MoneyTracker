//
//  WalletRow.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import SwiftUI

struct WalletRow: View {
    
    var Wallet: Wallet
    
    var body: some View {
        Text(Wallet.name)
    }
}

struct WalletRow_Previews: PreviewProvider {
    static var previews: some View {
        WalletRow(Wallet: Wallet(id: "1", name: "Nothing"))
    }
}
