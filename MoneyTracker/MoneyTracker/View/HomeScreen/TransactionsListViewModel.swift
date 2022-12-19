//
//  TransactionsListViewModel.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-08-12.
//

import Foundation

class TransactionsListViewModel: ObservableObject {
    
    @Published var sections: [TransactionSection] = []
    @Published var transactions: [Transaction] = []
    @Published var selectedDates: Set<DateComponents> = []
    @Published var transactionsDisplayOption: TransactionsDisplayOption = .all
    @Published var transactionsDisplayOptionTitle: String = TransactionsDisplayOption.all.rawValue
    @Published var selectedMonth: Int = 0
    @Published var selectedMonthString: String = ""
    
    private var originalTransactions: [Transaction] = []
    
    private var currentTransactionSortOption: TransactionSortOption = .date
    
    var months: [String] = Calendar.current.monthSymbols
    
    var transactionsDisplayOptionAvailable: [TransactionsDisplayOption] = TransactionsDisplayOption.allCases
    
    let getTransactionsFromContainerInteractor: GetTransactionsFromContainerInteractor = GetTransactionsFromContainerInteractorImpl(transactionRemoteDataSource: TransactionRemoteDataSourceImpl(), userRemoteDataSource: UserRemoteDataSourceImpl())
    
    func getTransactions(container: TransactionsContainer) async {
        let transactions = await self.getTransactionsFromContainerInteractor.execute(containerId: container.id)
        DispatchQueue.main.async {
            self.originalTransactions = transactions
            self.transactions = transactions
        }
    }
    
    func getMonthString(value: Int) -> String {
        return DateFormatter().monthSymbols[value - 1]
    }
    
    func sortByType() {
        self.currentTransactionSortOption = .transactionType
        var transactions = self.originalTransactions
        switch self.transactionsDisplayOption {
        case .all:
            transactions =  self.originalTransactions
        case .byMonth:
            transactions = self.getTransactionsFilterBySelectedMonth()
        }
        self.sections = sortByType(transactions: transactions)
    }
    
    private func sortByType(transactions: [Transaction]) -> [TransactionSection] {
        var sections: [TransactionSection] = []
        for type in TransactionType.allCases {
            let transactions = transactions.filter { $0.type == type }
            let sorted = transactions.sorted { $0.date > $1.date }
            sections.append(TransactionSection(transactions: sorted, title: type.rawValue))
        }
        return sections
    }
    
    func sortByDate() {
        self.currentTransactionSortOption = .date
        self.sections = []
        var transactions = self.originalTransactions
        switch self.transactionsDisplayOption {
        case .all:
            transactions =  self.originalTransactions
        case .byMonth:
            transactions = self.getTransactionsFilterBySelectedMonth()
        }
        self.transactions = sortByDate(transactions: transactions)
    }
    
    private func sortByDate(transactions: [Transaction]) -> [Transaction] {
        return  transactions.sorted { $0.date > $1.date }
    }
    
    func sortByCategories() {
        self.currentTransactionSortOption = .category
        self.sections = []
        var transactions = self.originalTransactions
        switch self.transactionsDisplayOption {
        case .all:
            transactions =  self.originalTransactions
        case .byMonth:
            transactions = self.getTransactionsFilterBySelectedMonth()
        }
        self.sections = sortByCategories(transactions: transactions)
    }
    
    private func sortByCategories(transactions: [Transaction]) -> [TransactionSection] {
        var sections: [TransactionSection] = []
        let categories = Set(transactions.map({ $0.category }))
        for category in categories {
            let transactions = transactions.filter { $0.category == category }
            sections.append(TransactionSection(transactions: transactions, title: category.uppercased()))
        }
        return sections
    }
    
    func getTransactionsFilterBySelectedMonth() -> [Transaction] {
        return self.originalTransactions.filter { Calendar.current.component(.month, from: $0.date) == self.selectedMonth}
    }
    
    func sortBySelectedMonth() {
        let transactions = getTransactionsFilterBySelectedMonth()
        switch self.currentTransactionSortOption {
        case .category:
            self.sections = self.sortByCategories(transactions: transactions)
        case .date:
            self.transactions = self.sortByDate(transactions: transactions)
        case .transactionType:
            self.sections = self.sortByType(transactions: transactions)
        default:
            break
        }
    }
    
    func sortAll() {
        switch self.currentTransactionSortOption {
        case .category:
            self.sections = self.sortByCategories(transactions: self.originalTransactions)
        case .date:
            self.transactions = self.sortByDate(transactions: self.originalTransactions)
        case .transactionType:
            self.sections = self.sortByType(transactions: self.originalTransactions)
        default:
            break
        }
    }
    
    func changeTransactionsDisplayOption(transactionsDisplayOption: TransactionsDisplayOption) {
        self.transactionsDisplayOptionTitle = transactionsDisplayOption.rawValue
        self.transactionsDisplayOption = transactionsDisplayOption
        switch transactionsDisplayOption {
        case .byMonth:
            self.selectedMonth = self.getCurrentMonth()
            self.selectedMonthString = self.months[selectedMonth - 1]
            sortBySelectedMonth()
        case .all:
            self.sortAll()
        }
    }
    
    
    
    func selectMonth(month: Int) {
        self.selectedMonth = month
        self.selectedMonthString = months[month - 1]
        self.sortBySelectedMonth()
    }
    
    private func getCurrentMonth() -> Int {
        return Calendar.current.component(.month, from: Date())
    }
}

struct TransactionSection: Hashable {
    var transactions: [Transaction]
    var title: String
}
