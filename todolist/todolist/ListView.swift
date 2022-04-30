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
                TextField("좋아하는 문구를 적어보세요!", text: .constant(""))
                    .font(.subheadline)
                    .padding(.leading, 10)
                    .frame(width: 360, height: 25, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.yellow))
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
                        //추후 ListGuideView로 변경
                        destination: EmptyView(),
                        label: {
                            Image(systemName: "info.circle")
                        })
                    //EditButton()
                    Spacer()
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
