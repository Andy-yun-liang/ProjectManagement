//
//  ProjectModel.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-13.
//

import Foundation
import SwiftData

@Model
class Project: Identifiable {
    
    @Attribute(.unique) var id: String
    var startDate = Date()
    var name = ""
    var projectFocus   = ""
    @Relationship(deleteRule:.cascade,inverse: \ProjectUpdate.project)
    var update: [ProjectUpdate] = [ProjectUpdate()]
    
    init(){
        id = UUID().uuidString
    }
    
    
}


@Model
class ProjectUpdate: Identifiable {
    
    @Attribute(.unique) var id : String
    var headline = ""
    var summary = ""
    var date = Date()
    var hours = 0.0
    var updateType = UpdateType.logs
    var project: Project?
    
    init(){
        id = UUID().uuidString
    }
    
    
}


enum UpdateType: Codable {
    
    case logs
    case milestone
    
}
