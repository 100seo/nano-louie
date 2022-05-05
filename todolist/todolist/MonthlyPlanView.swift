//
//  MonthlyPlanView.swift
//  todolist
//
//  Created by baek seohyeon on 2022/05/04.
//

import SwiftUI
struct MonthlyPlanView: View {
        
    
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d(E) h:mma "
        return formatter
    }
    struct TodoList:Identifiable{
        let id = UUID()
        var content: String
        var checked: Bool
    }
    @State var toDoString:String = ""
    @State private var dday = Date()
    @State private var todoList = [TodoList]()
    @State private var checked = false
    
    var body: some View {
        VStack {
            Form {
                Group {
                    DatePicker("마감기한", selection: $dday, in: Date()...)
                        .datePickerStyle(CompactDatePickerStyle())
                    TextField("enter new tasks", text: $toDoString, onCommit:{appendList()})
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.bgColor)
                .padding(.vertical,10)
            }
            .frame(height: 160)
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                UIScrollView.appearance().bounces = false
            }
            List{
                ForEach(0..<todoList.count, id:\.self) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(todoList[index].content)")
                                .lineLimit(2)
                                .fixedSize(horizontal: false, vertical: true)
                            Text("\(dday, formatter: dateFormatter)까지")
                                .font(.footnote)
                        }
                        Spacer()
                        CheckBoxView(checked:$todoList[index].checked)   
                    }
                    .listRowSeparator(.hidden)
                }
                .frame(width:340 ,height: 55)
            }
            .padding(.leading,5)
            .listStyle(PlainListStyle())
            
        }
    }
    
    func appendList(){
        let addList = TodoList(content: toDoString, checked: false)
        todoList.append(addList)
        toDoString = ""
    }
    
}


struct MonthlyPlanView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyPlanView()
    }
}
