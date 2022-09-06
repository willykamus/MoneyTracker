//
//  TransactionsListViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-12.
//

import Foundation

class TransactionsListViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    
}
