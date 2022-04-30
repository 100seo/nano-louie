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
                //.font(.system(size: 30))
                .tabItem {
                    Label("홈", systemImage: "house")
                }
                .tag(0)
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("캘린더")
                }
                .tag(1)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
