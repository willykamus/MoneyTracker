//
//  GetTransactionContainerCurrentTotalImplTest.swift
//  MoneyTrackerTests
//
//  Created by William Ching on 2023-04-10.
//

import XCTest
@testable import MoneyTracker

final class GetTransactionContainerCurrentTotalImplTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGiveInteractorWhenExecuteReturnProperValue() throws {
        //Given
        let transactions = [Transaction(id: "", amount: 1, category: "", date: Date(), containerId: "", containerName: "", type: .expense),
                            Transaction(id: "", amount: 2, category: "", date: Date(), containerId: "", containerName: "", type: .expense),
                            Transaction(id: "", amount: 4, category: "", date: Date(), containerId: "", containerName: "", type: .income)]
        let container = TransactionsContainer(id: "", transactions: transactions, scheduledTransactions: [], name: "")
        
        let testSubject: GetTransactionContainerCurrentTotal = GetTransactionContainerCurrentTotalImpl()
        
        // When
        let total = testSubject.execute(transactionsContainer: container)
        
        // Then
        XCTAssertEqual(1, total)
    }

    func testGiveInteractorWhenExecuteReturnProperValueNegativeResult() throws {
        //Given
        let transactions = [Transaction(id: "", amount: 1, category: "", date: Date(), containerId: "", containerName: "", type: .expense),
                            Transaction(id: "", amount: 2, category: "", date: Date(), containerId: "", containerName: "", type: .expense),
                            Transaction(id: "", amount: 1, category: "", date: Date(), containerId: "", containerName: "", type: .income)]
        let container = TransactionsContainer(id: "", transactions: transactions, scheduledTransactions: [], name: "")
        
        let testSubject: GetTransactionContainerCurrentTotal = GetTransactionContainerCurrentTotalImpl()
        
        // When
        let total = testSubject.execute(transactionsContainer: container)
        
        // Then
        XCTAssertEqual(-2, total)
    }
    
    func testGiveInteractorWhenExecuteReturnProperValueZeroResult() throws {
        //Given
        let transactions = [Transaction(id: "", amount: 1, category: "", date: Date(), containerId: "", containerName: "", type: .expense),
                            Transaction(id: "", amount: 2, category: "", date: Date(), containerId: "", containerName: "", type: .expense),
                            Transaction(id: "", amount: 3, category: "", date: Date(), containerId: "", containerName: "", type: .income)]
        let container = TransactionsContainer(id: "", transactions: transactions, scheduledTransactions: [], name: "")
        
        let testSubject: GetTransactionContainerCurrentTotal = GetTransactionContainerCurrentTotalImpl()
        
        // When
        let total = testSubject.execute(transactionsContainer: container)
        
        // Then
        XCTAssertEqual(0, total)
    }
}
