//
//  MoneyTrackerTests.swift
//  MoneyTrackerTests
//
//  Created by William Ching on 2022-03-13.
//

import XCTest
@testable import MoneyTracker

class MoneyTrackerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDate() {
        //Given
        let date = Date(timeIntervalSince1970: 1680148800)
        let scheduleTransaction = ScheduledTransaction(id: "1", transaction: Transaction(id: "2", amount: 1.0, category: "", date: date, containerId: "container", containerName: "Name", type: .expense), recurrence: .week)
        
        // When
        let createNextScheduleTransactions: CreateNextScheduleTransactions = CreateNextScheduleTransactionsImpl()
        let futureTransactions = createNextScheduleTransactions.execute(scheduledTransactions: [scheduleTransaction])
        
        // Then
        XCTAssertEqual(4, futureTransactions.count)
        XCTAssertEqual(Calendar.current.date(byAdding: .weekOfMonth, value: 1, to: date)!, futureTransactions[0].transaction.date)
        XCTAssertEqual(Calendar.current.date(byAdding: .weekOfMonth, value: 2, to: date)!, futureTransactions[1].transaction.date)
        XCTAssertEqual(Calendar.current.date(byAdding: .weekOfMonth, value: 3, to: date)!, futureTransactions[2].transaction.date)
        XCTAssertEqual(Calendar.current.date(byAdding: .weekOfMonth, value: 4, to: date)!, futureTransactions[3].transaction.date)
    }

}
