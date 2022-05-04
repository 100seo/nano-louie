//
//  ContentView.swift
//  todolist
//
//  Created by baek seohyeon on 2022/04/28.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            ListView()
                .tabItem {Label("Home", systemImage: "house")}
                .tag(0)
            CalendarView()
                .tabItem {Label("Calendar", systemImage : "calendar")}
                .tag(1)
                
        }.accentColor(.tabColor)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
