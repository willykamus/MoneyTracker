//
//  CategoryRemoteEntityMapper.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-09-09.
//

import Foundation

class CategoryRemoteEntityMapper {
    func toCategory(_ entity: CategoryRemoteEntity) -> Category {
        return Category(id: entity.id ?? UUID().uuidString, type: TransactionType(rawValue: entity.type)!, name: entity.name, budgetCategoryType: BudgetCategoryType(rawValue: entity.budgetCategoryType) ?? .none)
    }

    func toRemoteEntity(_ model: Category) -> CategoryRemoteEntity {
        return CategoryRemoteEntity(id: model.id, name: model.name, type: model.type.rawValue, budgetCategoryType: model.budgetCategoryType.rawValue)
    }
}

