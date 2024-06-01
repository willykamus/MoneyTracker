//
//  BudgetCategoryDetailViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2024-05-17.
//

import Foundation
import SwiftUI

class BudgetCategoryDetailViewModel: ObservableObject {
    
    @Published var summaries: [BudgetSubCategorySummary] = []
    
    private let getTransactionsForCategoryInteractor: GetTransactionsForCategory = GetTransactionsForCategoryImpl()
    
    func initialize(category: BudgetCategory) async {
            let result = await getTransactionsForCategoryInteractor.execute(category: category.category)
            DispatchQueue.main.async {
                switch result {
                case .success(let transactions):
                    let sum = transactions.map { $0.amount }.reduce(into: 0) { partialResult, element in
                        partialResult += element
                    }
                    self.summaries.append(BudgetSubCategorySummary(title: category.category.name, amount: String(sum)))
                default:
                    break
                }
            }
        
    }
}

struct BudgetSubCategorySummary: Hashable {
    var title: String
    var amount: String
}
