//
//  CalendarView.swift
//  todolist
//
//  Created by baek seohyeon on 2022/04/28.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date()
    @State var MonthCount: Int = 0
    //var temp = 5
    
    var body: some View {
        NavigationView{
            VStack {
                Text("이번 달에는 총 \(MonthCount) 개의 할일을 끝냈어요🔥")
                    .background(){
                        Color.yellow
                            .frame(width: 360, height: 25)
                    }
                    .padding(.bottom, 60)
                DatePicker("",selection: $date,displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .frame(width: 360, height: 200)
                    //.clipped()
                Spacer()
            }
            .navigationBarTitle("Calendar",displayMode: .inline)
            
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("캘린더")
                        .font(.headline)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: CalendarGuideView(),
                        label: {
                            Image(systemName: "info.circle")
                        })
                }
            }
        }
    }
}

struct calendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
