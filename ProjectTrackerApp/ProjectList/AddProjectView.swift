//
//  AddProjectView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-14.
//

import SwiftUI
import SwiftData

struct AddProjectView: View {
    
    var project : Project
    @State var projectName : String = ""
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        
        ZStack{
            
            Color("blackv3").opacity(0.3)
            
            VStack(alignment:.leading){
                
                Text("New Project").font(.bigHeadline).foregroundStyle(.white)
                
                HStack{
                    TextField("Project Name",text: $projectName).textFieldStyle(.roundedBorder)
                    
                    Button("Save"){
                        project.name = projectName
                        modelContext.insert(project)
                        
                    }.buttonStyle(.borderedProminent)
                        .tint(.blue)
                    
                    
                }
                
                Spacer()
                
            }.padding()
            
            
            
        }
        
        
    }
}

