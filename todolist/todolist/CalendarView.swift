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
                Text("이번 달에는 총 \(MonthCount) 개의 할일을 끝냈어요")
                    .font(.subheadline)
                    .padding(.leading, 10)
                    .frame(width: 360, height: 25, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.yellow))
                    .padding(.bottom, 25)
                DatePicker("",selection: $date,displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .frame(width: 360, height: 300)
                List(0..<1){row in
                    //추후 MissionView로 변경
                    NavigationLink(destination: EmptyView()){
//                        Rectangle()
//                            .frame(width: 30, height: 30)
                       
                        Image(systemName: "checkmark.bubble")
                            .font(.system(size: 25))
                            .padding(.leading, 3.0)
                        Text("Weekly Missions")
                            .padding(.leading, 15.0)
                    }

                    .frame(height: 80)
                    //추후 CharacterView로 변경
                    NavigationLink(destination: EmptyView()){
//                        Rectangle()
//                            .frame(width: 30, height: 30)
                        Image(systemName: "tortoise")
                            .font(.system(size: 22))
                        Text("Character Story")
                            .padding(.leading, 10.0)
                    }.frame(height: 80)
                    //.listRowSeparator(.hidden)
                }
                .listStyle(InsetListStyle())
            }
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Calendar")
                        .font(.headline)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(
                        //추후 CalendarGuideView로 변경
                        destination: EmptyView(),
                        label: {Image(systemName: "info.circle")})
                }
            }
            .navigationBarTitle("Calendar",displayMode: .inline)
        }
        //nav
    }
    //body
}
    
    
struct calendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
