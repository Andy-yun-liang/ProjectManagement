//
//  ContentView.swift
//  ProjectTrackerApp
//
//  Created by Andy Liang on 2024-11-13.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("Plus Icon")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!").font(Font.screenHeading)
                .foregroundStyle(Color("black opacity"))
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
