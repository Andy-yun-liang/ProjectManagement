//
//  ContentView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-13.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    
    @State private var newProject : Project?
    @Query private var projects : [Project]
    @State private var selectedProject : Project?
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("blackv3").ignoresSafeArea()
                
                
                VStack(alignment: .leading) {
                    Text("Projects")
                        .font(Font.screenHeading)
                        .foregroundStyle(Color.white)
                    
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .leading, spacing: 26){
                            
                            ForEach(projects){p in
                                
                                ProjectCardView(project: p)
                                    .onTapGesture {
                                        selectedProject = p
                                    }
                                    .onLongPressGesture{
                                    
                                    newProject = p
                                    }
                                
                             
                                
                            }
                            
                        }
                    }
                    
                }
                .padding()
                
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        Spacer()
                        
                        Button(action: {
                            //creates new project
                            
                            newProject = Project()
                            
                        }, label: {
                            
                            ZStack{
                                Circle().frame(width: 67,height: 67).foregroundStyle(Color("blackv2"))
                                Image("Plus Icon")
                                
                                
                            }
                            
                           
                        })//end of add btn
                        
                        
                    }.padding(.trailing) // end of vstack that pushes add btn to bottom right
                    
                }
                
            }.navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
           
        }
        .sheet(item: $newProject) { project in
            
            let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            
            EditProjectView(project: project, isEditMode: isEdit)
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.fraction(0.4)])
                .ignoresSafeArea(.keyboard)
        }
        
    }
}

#Preview {
    ProjectListView()
}
