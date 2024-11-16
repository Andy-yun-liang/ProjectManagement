//
//  ProjectDetailUpdateCard.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-15.
//

import SwiftUI

struct ProjectDetailUpdateCard: View {
    var body: some View {
        
        ZStack{
            
            Rectangle().foregroundStyle(Color("blackv2")).shadow(radius: 10,x:0,y:4)
            
            
            
            VStack(alignment:.leading,spacing: 10){
                
                    HStack{
                        Text("Friday, November 15, 2024")
                        Spacer()
                        Text("17 Hours")
                    }.padding(.vertical,10).padding(.horizontal,20).background(Color("pinkv1"))
                    
                Text("Made progress on the progress bar").padding(.horizontal,20).font(.smallHeadline)
                    
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum et justo suscipit. The key is to add the padding before applying the background. This ensures the padding affects the content but not the background color itself. You can adjust the padding values (20 in this example) to whatever spacing looks best in your design.").padding(.horizontal,20)
                    .padding(.bottom,10)
                
                }.font(.regularText).foregroundColor(.white)
            
            
        }.clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProjectDetailUpdateCard()
}
