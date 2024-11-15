//
//  ProjectCardView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-14.
//

import SwiftUI

struct ProjectCardView: View {
    
    var projectTopic : String
    var goal : String
    var cardColor : Color
   
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20).fill(cardColor).shadow(radius: 10,x:0,y:4)
            
            VStack(alignment: .leading, spacing: 10){
                Text(projectTopic).font(.bigHeadline)
                    
                
                HStack(alignment: .center,spacing: 13){
                    Spacer()
                    StatBoxView(metric: "Hours", stat: "290", statboxColor: Color("pink"))
                    StatBoxView(metric: "Sessions", stat: "41", statboxColor: Color("pink"))
                    StatBoxView(metric: "Updates", stat: "122", statboxColor: Color("pink"))
                    StatBoxView(metric: "Wins", stat: "51", statboxColor: Color("pink"))
                    Spacer()
                }
                
                Text("My current focus is ...").font(.featuredText)
                
                Text(goal).font(.featuredText).bold()
                
            }.foregroundStyle(.white).padding()
            
        }
    }
}

#Preview {
    ProjectCardView(projectTopic: "Project 1", goal: "Learning SwiftUI",cardColor: Color("blackv2"))
}
