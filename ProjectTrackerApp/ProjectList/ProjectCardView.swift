//
//  ProjectCardView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-14.
//

import SwiftUI

struct ProjectCardView: View {
    
    var project : Project
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20).fill(Color("blackv2")).shadow(radius: 10,x:0,y:4)
            
            VStack(alignment: .leading, spacing: 10){
                Text(project.name).font(.bigHeadline)
                    
                
                HStack(alignment: .center,spacing: 13){
                    Spacer()
                    StatBoxView(metric: "Hours", stat: "290", statboxColor: Color("pinkv1"))
                    StatBoxView(metric: "Sessions", stat: "41", statboxColor: Color("pinkv1"))
                    StatBoxView(metric: "Updates", stat: "122", statboxColor: Color("pinkv1"))
                    StatBoxView(metric: "Wins", stat: "51", statboxColor: Color("pinkv1"))
                    Spacer()
                }
                
                Text("My current focus is ...").font(.featuredText)
                
                Text(project.projectFocus).font(.featuredText).bold()
                
            }.foregroundStyle(Color("whitev1")).padding()
            
        }
    }
}

#Preview {
    ProjectCardView(project: Project())
}
