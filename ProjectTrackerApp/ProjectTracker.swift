//
//  ProjectTrackerAppApp.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-13.
//

import SwiftUI
import SwiftData

@main
struct ProjectTracker: App {
    let container: ModelContainer
    
    init() {
        // Set up the container when the app initializes
        do {
            let schema = Schema([Project.self, ProjectUpdate.self])
            let modelConfiguration = ModelConfiguration(schema: schema)
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(container)
        }
    }
}
