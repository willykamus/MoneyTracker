//
//  GetCategoriesInteractorImpl.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-09-13.
//

import Foundation

class GetCategoriesInteractorImpl: GetCategoriesInteractor {
    
    let categoriesRemoteDataSource: CategoryRemoteDataSource = CategoryRemoteDataSourceImpl()
    
    func execute() async -> Result<[Category], Error> {
        return await categoriesRemoteDataSource.getCategories()
        
    }
    
    
}
