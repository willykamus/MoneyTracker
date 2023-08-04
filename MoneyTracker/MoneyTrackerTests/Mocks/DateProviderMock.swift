//
//  DateProviderMock.swift
//  MoneyTrackerTests
//
//  Created by William Ching on 2023-07-16.
//

import Foundation
@testable import MoneyTracker

class DateProviderMock: DateProvider {
    
    var dateToReturn: Date = Date()
    
    func nowAsDate() -> Date {
        return dateToReturn
    }
    
    
}
