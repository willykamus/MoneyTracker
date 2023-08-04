//
//  DateProvider.swift
//  MoneyTracker
//
//  Created by William Ching on 2023-07-16.
//

import Foundation

protocol DateProvider {
    func nowAsDate() -> Date
}
