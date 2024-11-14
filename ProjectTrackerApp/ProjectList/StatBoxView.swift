//
//  StatBoxView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-14.
//

import SwiftUI

struct StatBoxView: View {
    
    var metric: String
    var stat: String
    var statboxColor : Color
    
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 15).fill(statboxColor)
            VStack{
                Text(metric).font(.captionText)
                
                Text(stat).font(.featuredNumber).bold()
                
            }
        }.frame(width: 60,height: 40)

    }
}

#Preview {
    StatBoxView(metric: "Hours", stat: "290", statboxColor: Color("pink"))
}
