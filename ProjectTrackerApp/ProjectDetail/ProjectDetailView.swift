//
//  ProjectDetailView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-15.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    var project: Project
    @State private var isShowingEditFocus = false
    @State private var newUpdate : ProjectUpdate?
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("blackv3").ignoresSafeArea() //changes overall theme color
            
            // Main content
            VStack(spacing: 0) {
                // Header section
                VStack(alignment: .leading, spacing: 10) {
                    Text(project.name)
                        .font(.screenHeading)
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    
                    HStack(alignment: .center, spacing: 25) {
                        Spacer()
                        StatBoxView(metric: "Hours", stat: "290", statboxColor: Color("pinkv1"))
                        StatBoxView(metric: "Sessions", stat: "41", statboxColor: Color("pinkv1"))
                        StatBoxView(metric: "Updates", stat: "122", statboxColor: Color("pinkv1"))
                        StatBoxView(metric: "Wins", stat: "51", statboxColor: Color("pinkv1"))
                        Spacer()
                    }
                    if project.projectFocus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        Text("My current focus is...")
                            .font(.featuredText)
                            .bold()
                            .padding(.leading, 40)
                    }
                    HStack {
                        
                        if project.projectFocus.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            
                            Button{
                                completeMilestone()
                            }label: {
                                Image(systemName: "checkmark.square")
                                Text(project.projectFocus)
                            }
                            
                        }else{
                            Button("Tap here to add a focus"){
                                isShowingEditFocus = true
                            }.padding(.vertical,12).bold()
                        }
                    }
                    .font(.featuredText)
                    .padding(.leading, 60)
                }
                .foregroundStyle(Color("whitev1"))
                .padding(.top, 80)
                .padding(.bottom, 10)
                .background(Color("blackv2").clipShape(.rect(bottomLeadingRadius: 15,bottomTrailingRadius: 15)))
                
                // Timeline section
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .leading) {
                        // Timeline vertical line
                        
                        if !project.updates.isEmpty{
                            Rectangle()
                                .fill(Color("whitev1").opacity(0.85))
                                .frame(width: 4)
                                .padding(.leading, 43)
                            
                            Rectangle()
                                .fill(Color("whitev1").opacity(0.35))
                                .frame(width: 4)
                                .padding(.leading, 49)
                        }
                        // Cards
                        VStack(spacing: 26) {
                            
                            ForEach(project.updates.sorted(by: { pU1, pU2 in
                                pU1.date > pU2.date
                            })){
                                pUpdate in
                                ProjectDetailUpdateCardView(myprojectUpdate: pUpdate)
                                
                            }
                           
                        }
                        .padding(.top, 20)
                    }
                    .padding(.horizontal, 20)
                }
            }
            
            // Add button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        newUpdate = ProjectUpdate()
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 67,height: 67)
                                .foregroundStyle(Color("blackv2"))
                            Image("Plus Icon")
                        }
                    }
                    .padding(.trailing)
                    .padding(.bottom)
                    
                }
            }
        }
        .ignoresSafeArea()
        .sheet(item: $newUpdate){
            nUpdate in
            AddProjectUpdate(newUpdate: nUpdate, project: project).presentationBackground(.ultraThinMaterial)
                .presentationDetents([.fraction(0.4)])
                .ignoresSafeArea(.keyboard)
        }.sheet(isPresented: $isShowingEditFocus, content: {
            EditProjectFocusView(project: project).presentationBackground(.ultraThinMaterial)
                .presentationDetents([.fraction(0.4)])
                .ignoresSafeArea(.keyboard)
        })
    }
    
    
    func completeMilestone(){
        
        //create a new project update for milestone
        let milestoneUpdate = ProjectUpdate()
        milestoneUpdate.updateType = .milestone
        milestoneUpdate.headline = "Milestone Achieved !"
        milestoneUpdate.summary = project.projectFocus
        project.updates.insert(milestoneUpdate, at: 0)
        

        //reset projectFocus to null
        project.projectFocus = ""
    }
    
}

#Preview {
    ProjectDetailView(project: Project())
}

