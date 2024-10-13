// MacroFlowv5App.swift
// MacroFlowv5
// Created by Ryan D'Mello on 13/10/2024.

import SwiftUI
import SwiftData

/// Main application struct for the MacroFlowv5 app.
@main
struct MacroFlowv5App: App {
    /// Shared model container to manage data models used in the app.
    var sharedModelContainer: ModelContainer = {
        // Define the schema for the app, including UserProfile.
        let schema = Schema([
            UserProfile.self, // Include UserProfile in the schema
            DailyEntry.self // Include DailyEntry in the schema for tracking daily data
        ])
        // Create model configuration to specify storage options.
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            // Create and return the ModelContainer with the specified schema and configuration.
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            // Handle the error if ModelContainer creation fails.
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            // Main view of the app, injecting the model container for data access.
            ContentView()
                .modelContainer(sharedModelContainer) // Pass the model container
        }
    }
}
