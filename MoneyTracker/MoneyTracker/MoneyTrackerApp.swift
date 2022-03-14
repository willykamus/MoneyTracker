//
//  MoneyTrackerApp.swift
//  MoneyTracker
//
//  Created by William Ching on 2022-03-13.
//

import SwiftUI

@main
struct MoneyTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
