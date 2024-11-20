//
//  AddProjectUpdate.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-16.
//

import SwiftUI
import SwiftData

struct AddProjectUpdate: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var newUpdate: ProjectUpdate
    var project: Project
    @State private var summary = ""
    @State private var string_hrs = ""
    @State private var hours : Double = 0.0
    @State private var headline = ""
    @State var isEditMode : Bool 
    @State private var showDeleteConfirmation: Bool = false
    
    var body: some View {
        
        ZStack{
            
            Color("blackv3").opacity(0.3)
            
            VStack(spacing:20){
                Text(isEditMode ?
                     "Edit Update" :"New Update").font(.bigHeadline).foregroundStyle(Color(
                     "whitev1"))
                
                TextField("Headline",text: $headline)
                
                TextField("Summary",text:$summary, axis: .vertical)
                
                TextField("Hours",text: $string_hrs).keyboardType(.numberPad)
                    .onChange(of:string_hrs){
                        if let num = Double(string_hrs){
                            hours = num
                        }
                    }
                
                
                Button(isEditMode ? "Save" : "Add"){
            
                        newUpdate.headline = headline
                        newUpdate.summary = summary
                        newUpdate.hours = hours
                    
                    if !isEditMode{
                        
                        project.updates.insert(newUpdate, at: 0)
                    }
                    
                    
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.blue)
                
                if isEditMode{
                    Button("Delete"){
                        showDeleteConfirmation = true
                        
                        
                    }.buttonStyle(.borderedProminent)
                        .tint(.red)
                }
                
            }.textFieldStyle(.roundedBorder).padding()
            
            Spacer()
        }
        .confirmationDialog("Delete the Update?", isPresented: $showDeleteConfirmation) {
            
            Button("Yes, delete the update"){
                project.updates.removeAll{
                    updateObjectElement in updateObjectElement.id == newUpdate.id
                }
                dismiss()
            }
        }.onAppear{
            headline = newUpdate.headline
            summary = newUpdate.summary
            
            
            if isEditMode{
                string_hrs = String(Int(newUpdate.hours))
            }
        }
    }
}

