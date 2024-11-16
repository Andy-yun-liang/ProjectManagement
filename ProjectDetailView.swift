//
//  ProjectDetailView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-15.
//

import SwiftUI

struct ProjectDetailView: View {
    
    var project: Project
    
    var body: some View {
        
        VStack{
            
            Text(project.name)
        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
