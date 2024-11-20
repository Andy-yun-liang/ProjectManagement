//
//  AddProjectView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-14.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var project : Project
    var isEditMode : Bool
    
    
    @State var projectName : String = ""
    @State var showDeleteConfirmation : Bool = false
    
    
    var body: some View {
        
        
        ZStack{
            
            Color("blackv3").opacity(0.3)
            
            VStack(alignment:.leading){
                
                Text(isEditMode ? "Edit Project" : "New Project").font(.bigHeadline).foregroundStyle(Color("whitev1"))
                
                HStack{
                    TextField("Project Name",text: $projectName).textFieldStyle(.roundedBorder)
                    
                    Button(isEditMode ? "Save" : "Add"){
                        
                        if isEditMode
                        {
                            project.name = projectName
                            
                        }
                        else{
                            
                            project.name = projectName
                            modelContext.insert(project)
                            
                        }
                        dismiss()
                    }.buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines) == "")
                    
                    
                    if isEditMode{
                        
                        //show delete btn
                        
                        Button("Delete"){
                         //show delete confirmation dialog
                            showDeleteConfirmation = true
                            
                        }.buttonStyle(.borderedProminent)
                            .tint(.red)
                        
                    }
                    
                }
                
                Spacer()
                
            }.padding()
            
            
        }
        .confirmationDialog("Delete Project?", isPresented: $showDeleteConfirmation, titleVisibility: .visible) {
            Button("Yes, delete it"){
                modelContext.delete(project)
                dismiss()
            }
        }.onAppear{
            projectName = project.name
        }
        
    }
}

