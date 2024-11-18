//
//  ProjectDetailUpdateCard.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-15.
//

import SwiftUI

struct ProjectDetailUpdateCardView: View {
    
    var myprojectUpdate: ProjectUpdate
    
    private func getMilestoneGradient() -> LinearGradient {
           LinearGradient(
               gradient: Gradient(colors: [Color("bluevLeft"), Color("bluevRight")]),
               startPoint: .leading,
               endPoint: .trailing
           )
       }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                                
                
                
                //display checkmark seal if its a milestone update else hours
                if myprojectUpdate.updateType == .milestone{
                    Text(DateHelper.projectUpdateDate(inputDate: myprojectUpdate.date)).bold()
                    Spacer()
                    Image(systemName: "trophy").foregroundColor(Color("whitev1")).bold()
                    
                }else{
                    
                    Text(DateHelper.projectUpdateDate(inputDate: myprojectUpdate.date))
                    Spacer()
                    
                    Text("\(String(Int(myprojectUpdate.hours))) \(myprojectUpdate.hours == 1 ? "hour" : "hours")")
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background{
                if myprojectUpdate.updateType == .milestone {
                    
                    getMilestoneGradient()
                
                }else{
                    Color("pinkv1")
                }
                
                    }
            
            Text(myprojectUpdate.headline)
                .padding(.horizontal, 20)
                .font(.smallHeadline)
            
            Text(myprojectUpdate.summary)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
        }
        .font(.regularText)
        .foregroundColor(.white)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("blackv1"))
                .shadow(radius: 10, x: 0, y: 4)
        }
    }
    
   
    
}

