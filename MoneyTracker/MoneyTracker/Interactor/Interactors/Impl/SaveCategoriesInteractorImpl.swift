//
//  SaveCategoriesInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-09-05.
//

import Foundation

class SaveCategoriesInteractorImpl: SaveCategoriesInteractor {
    func execute(categories: [Category]) async {
        await self.categoryRemoteDataSource.save(categories: categories)
    }
    
    private let categoryRemoteDataSource: CategoryRemoteDataSource = CategoryRemoteDataSourceImpl()
}
