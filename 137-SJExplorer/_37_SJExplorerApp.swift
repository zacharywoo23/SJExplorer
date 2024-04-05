//
//  _37_SJExplorerApp.swift
//  137-SJExplorer
//
//  Created by Jason Ofiana on 3/15/24.
//

import SwiftUI
import SwiftData
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    print("Application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
      FirebaseApp.configure()
      
    return true
  }
}

@main
struct _37_SJExplorerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

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
