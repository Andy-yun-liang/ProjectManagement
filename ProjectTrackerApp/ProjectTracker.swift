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
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self,ProjectUpdate.self])
        }
    }
}
