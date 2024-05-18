//
//  BudgetCategoryDetailViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-17.
//

import Foundation
import SwiftUI

class BudgetCategoryDetailViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    func initialize(category: Category) {
        
    }
}
