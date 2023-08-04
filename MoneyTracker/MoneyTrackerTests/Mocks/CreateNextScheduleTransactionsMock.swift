//
//  CreateNextScheduleTransactionsMock.swift
//  MoneyTrackerTests
//
//  Created by William Ching on 2023-06-06.
//

import Foundation
@testable import MoneyTracker

class CreateNextScheduleTransactionsMock: CreateNextScheduleTransactions {
    
    var returnValue: [ScheduledTransaction] = []
    
    func execute(scheduledTransactions: [ScheduledTransaction]) -> [ScheduledTransaction] {
        return returnValue
    }
    
    
}
