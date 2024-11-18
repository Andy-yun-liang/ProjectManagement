//
//  EditProjectGoalView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-18.
//

import SwiftUI

struct EditProjectFocusView: View {
    
    var project : Project
    @State var projectFocus : String = ""
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        
        ZStack{
            
            Color("blackv3").opacity(0.3)
            
            VStack(alignment:.leading){
                
                Text("Edit Project Focus").font(.bigHeadline).foregroundStyle(Color("whitev1"))
                
                HStack{
                    TextField("Add a focus",text: $projectFocus).textFieldStyle(.roundedBorder)
                    
                    Button("Save"){
                        project.projectFocus = projectFocus
                        modelContext.insert(project)
                        dismiss()
                        
                    }.buttonStyle(.borderedProminent)
                        .tint(.blue)
                    
                    
                }
                
                Spacer()
                
            }.padding()
            
            
            
        }
        
        
    }
}



#Preview {
    EditProjectFocusView(project: Project())
}
