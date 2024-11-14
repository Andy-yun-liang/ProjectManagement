//
//  ContentView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-13.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        
        ZStack{
            Color("blackv3").ignoresSafeArea()
            
            
            VStack(alignment: .leading) {
                Text("Projects")
                    .font(Font.screenHeading)
                    .foregroundStyle(Color.white)
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading, spacing: 26){
                        ProjectCardView(projectTopic: "Project Title 1", goal: "Learning x", cardColor: Color("blackv2"))
                        ProjectCardView(projectTopic: "Project Title 2", goal: "Learning y", cardColor: Color("blackv2"))
                        ProjectCardView(projectTopic: "Project Title 1", goal: "Learning x", cardColor: Color("blackv2"))
                        ProjectCardView(projectTopic: "Project Title 2", goal: "Learning y", cardColor: Color("blackv2"))
                        
                    }
                }
               
            }
            .padding()
            
            HStack{
                
                Spacer()
                
                VStack{
                    Spacer()
                    
                    Button(action: {
                        print("hello")
                    }, label: {
                        
                        ZStack{
                            Circle().frame(width: 67,height: 67).foregroundStyle(Color("blackv2"))
                            Image("Plus Icon")
                            
                            
                        }
                        
                        
                        
                        
                        
                    })//end of add btn
                    
                    
                }.padding(.trailing) // end of vstack that pushes add btn to bottom right
            
            }
            
        }//end of outer zstack
        
    }
}

#Preview {
    ProjectListView()
}
