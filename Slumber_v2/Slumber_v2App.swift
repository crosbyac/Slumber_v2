//
//  Slumber_v2App.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import SwiftUI

@main
struct Slumber_v2App: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var order = UserSettings()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
