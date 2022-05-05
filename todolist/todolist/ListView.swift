//
//  ListView.swift
//  todolist
//
//  Created by baek seohyeon on 2022/04/28.
//

import SwiftUI


struct ListView: View {
    
    struct TodoList:Identifiable{
        let id = UUID()
        var content: String
        var checked: Bool
    }
    var dateFormatter:DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "YY / M / d (E)"
        return formatter
    }
    @State var toDoString:String = ""
    @State private var todoList = [TodoList]()
    @State private var checked = false
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("이 달의 각오를 적어보세요!", text: .constant(""))
                    .font(.subheadline)
                    .padding(.leading, 10)
                    .frame(width: 360, height: 25, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.pointColor))
                    //.disableAutocorrection(true)
                Rectangle()
                    .frame(width: 360, height: 200)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10.0)
                Text("\(date, formatter: dateFormatter)")
                HStack{
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                        .padding(.leading, 20)
                    TextField("enter new tasks", text: self.$toDoString, onCommit:{appendList()}
                    )
                    .padding(.leading, 10.0)
                    .frame(width: 340, height: 50)
                }
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.bgColor).padding(.horizontal))
                
                List {
                    ForEach(0..<todoList.count, id:\.self) { index in
                        
                        HStack {
                            
                            Text("\(todoList[index].content)")
                            Spacer()
                            CheckBoxView(checked:$todoList[index].checked)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .frame(height: 47)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("Home",displayMode: .inline)
            
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Home")
                        .font(.headline)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: GuideView(),
                        label: {
                            Image(systemName: "info.circle")
                        })
                }
            }
        }
    }
    
    func appendList(){
        let addList = TodoList(content: toDoString, checked: false)
        todoList.append(addList)
        toDoString = ""
    }
}





struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
