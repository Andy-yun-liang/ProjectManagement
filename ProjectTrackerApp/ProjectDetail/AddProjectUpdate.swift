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
    
    var body: some View {
        
        ZStack{
            
            Color("blackv3").opacity(0.3)
            
            VStack(spacing:20){
                Text("New Update")
                
                TextField("Headline",text: $headline)
                
                TextField("Summary",text:$summary, axis: .vertical)
                
                TextField("Hours",text: $string_hrs).keyboardType(.numberPad)
                    .onChange(of:string_hrs){
                        if let num = Double(string_hrs){
                            hours = num
                        }
                    }
                
                
                Button("Save"){
                    newUpdate.headline = headline
                    newUpdate.summary = summary
                    newUpdate.hours = hours
                    project.updates.append(newUpdate) //this line here esentially ensures that updates belong in the correct project. So if i were to create an update inside project 1, the update only belongs to project 1.
                    dismiss()
                }.buttonStyle(.borderedProminent)
                
            }.textFieldStyle(.roundedBorder).padding()
            
            Spacer()
        }
    }
}

