//
//  ProjectDetailView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-15.
//

import SwiftUI

struct ProjectDetailView: View {
    
    var project: Project
    
    var body: some View {
        
        ZStack{
            
            Color("blackv3") //changes overall theme color
            
           
            
            VStack{
                
                VStack(alignment: .leading, spacing: 10){
                    Text(project.name)
                        .font(.screenHeading).padding(.leading,20).padding(.top,10)
                    
                    
                    
                    HStack(alignment: .center, spacing: 25){
                        Spacer()
                        StatBoxView(metric: "Hours", stat: "290", statboxColor: Color("pinkv1"))
                        StatBoxView(metric: "Sessions", stat: "41", statboxColor: Color("pinkv1"))
                        StatBoxView(metric: "Updates", stat: "122", statboxColor: Color("pinkv1"))
                        StatBoxView(metric: "Wins", stat: "51", statboxColor: Color("pinkv1"))
                        Spacer()
                    }
                    
                    Text("My current focus is...").font(.featuredText).bold().padding(.leading , 40)
                    
                    
                        HStack{
                            Image(systemName: "checkmark.square")
                            Text("Learning SwiftUI")
                        }.font(.featuredText).padding(.leading,60)
                        
                    
            
                }.foregroundStyle(Color("whitev1")).padding(.top,80).padding(.bottom,10).background(Color("blackv2").clipShape(.rect(bottomLeadingRadius: 15,bottomTrailingRadius: 15)))
                
               
                ZStack{
                    
                    
                    
                    ScrollView(showsIndicators: false){
                        
                        
                        VStack(spacing:26){
                            
                            ProjectDetailUpdateCard()
                            ProjectDetailUpdateCard()
                            ProjectDetailUpdateCard()
                            ProjectDetailUpdateCard()
                            ProjectDetailUpdateCard()
                            
                        }
                    }.padding(.horizontal,20)
                    
                }
                
            }
            
            
            
            
            HStack{
                
                Spacer()
                
                VStack{
                    Spacer()
                    
                    Button(action: {
          //to be implemented
                    }, label: {
                        
                        ZStack{
                            Circle().frame(width: 67,height: 67).foregroundStyle(Color("blackv2"))
                            Image("Plus Icon")
                            
                            
                        }
                        
                       
                    })//end of add btn
                    
                    
                }.padding(.trailing).padding(.bottom) // end of vstack that pushes add btn to bottom right
                
            }

            
            
        }.ignoresSafeArea()//end of ZStack
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
