//
//  _37_SJExplorerApp.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 3/15/24.
//

import SwiftUI
import SwiftData

@main
struct _37_SJExplorerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SJExplorer()
        }
        .modelContainer(sharedModelContainer)
    }
}
