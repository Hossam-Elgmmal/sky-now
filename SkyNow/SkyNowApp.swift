//
//  SkyNowApp.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import SwiftUI

@main
struct SkyNowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
