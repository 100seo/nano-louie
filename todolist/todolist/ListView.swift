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
    @State var toDoString:String = ""
    @State private var todoList = [TodoList]()
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("좋아하는 문구를 적어보세요!", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .font(.caption)
                    .padding(.leading, 20.0)
                    .background(){
                        Color.yellow
                            .frame(width: 360, height: 25)
                    }
                Rectangle()
                    .frame(width: 360, height: 260)
                HStack{
                    TextField("enter new tasks", text: self.$toDoString, onCommit:{appendList()}
                    )
                    .padding(.leading, 10.0)
                    .frame(width: 360, height: 50)
                    .background(RoundedRectangle(cornerRadius: 3).fill(Color.gray))
                }
                List(todoList, selection: $multiSelection){
                    Text($0.content)
                    
                }
                
                .listStyle(PlainListStyle())
                //.onDelete(perform: removeList)
            }
            .navigationBarTitle("Home",displayMode: .inline)
            
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("홈")
                        .font(.headline)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: Text("여기에 도움말을 불러오면 됨"),
                        label: {
                            Image(systemName: "info.circle")
                        })
                    EditButton()
                }
            }
        }
    }
    
    func appendList(){
        let addList = TodoList(content: toDoString, checked: false)
        todoList.append(addList)
        toDoString = ""
    }
    func removeList(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
    }
    
}





struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
