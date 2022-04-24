//
//  TransactionsContainerRow.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-04-22.
//

import SwiftUI

struct TransactionsContainerRow: View {
    
    var transactionsContainer: TransactionsContainer
    
    var body: some View {
        Text(transactionsContainer.name)
    }
}

struct TransactionsContainerRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsContainerRow(transactionsContainer: TransactionsContainer(id: "1", name: "Nothing"))
    }
}
