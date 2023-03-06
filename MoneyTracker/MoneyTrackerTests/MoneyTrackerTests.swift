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

    func testExample() throws {
        // Given
        let transaction = Transaction(id: "1", amount: 1, category: "Casa", date: Date(), containerId: "2", type: .expense, recurrence: .never)
        
        // When
        let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: Date())))!
        print(startOfMonth)
        let lastOfMonth = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
        print(lastOfMonth)
        let weeks = Calendar.current.dateComponents([.weekOfMonth], from: Date(), to: lastOfMonth).weekOfMonth
        print(weeks)
        let days = Calendar.current.numberOfDaysBetween(from: Date(), to: Date().endOfMonth())
        print(days)
        let currentDay = Calendar.current.dateComponents([.day], from: transaction.date).day
        print(currentDay)
        print(2 % 2)
    }
    
    func testDailyRecurrence() {
        // Given
        let transaction = Transaction(id: "1", amount: 1.0, category: "category", date: Date.now, containerId: "wallet", type: .income, recurrence: .day)
        
        // When
        let interactor: CreateMonthScheduleTransactions = CreateMonthScheduleTransactionsImpl()
        let transactions = interactor.execute(transactions: [transaction])
        
        // Then
        XCTAssertEqual(transactions.count, 6)
    }
    
    func testWeeklyRecurrence() {
        // Given
        let transaction = Transaction(id: "1", amount: 1.0, category: "category", date: Date(timeIntervalSince1970: 1675253635), containerId: "wallet", type: .income, recurrence: .week)
        
        // When
        let interactor: CreateMonthScheduleTransactions = CreateMonthScheduleTransactionsImpl()
        let transactions = interactor.execute(transactions: [transaction])
        print(transactions)
        // Then
        XCTAssertEqual(transactions.count, 3)
    }
    
    func testTwoWeeksRecurrence() {
        // Given
        let transaction = Transaction(id: "1", amount: 1.0, category: "category", date: Date(timeIntervalSince1970: 1675253635), containerId: "wallet", type: .income, recurrence: .twoWeeks)
        
        // When
        let interactor: CreateMonthScheduleTransactions = CreateMonthScheduleTransactionsImpl()
        let transactions = interactor.execute(transactions: [transaction])
        print(transactions)
        // Then
        XCTAssertEqual(transactions.count, 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
