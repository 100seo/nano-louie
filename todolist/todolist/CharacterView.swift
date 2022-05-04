//
//  CharacterView.swift
//  todolist
//
//  Created by baek seohyeon on 2022/05/04.
//

import SwiftUI

struct CharacterView: View {
    
    let data = Array(1...30).map{"목록\($0)"}
    let columns = [GridItem(.adaptive(minimum: 200))]
    @State var arr1: [String] = ["루이", "로이", "라이"]
    @State var arr2: [String] = ["할 일을 앞으로 \(2)번 완료하기","할 일을 앞으로 \(5)번 완료하기"]
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 30){
                ForEach(arr1, id: \.self){i in
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 320, height: 280)
                            .foregroundColor(Color.subColor)
                            .shadow(radius: 10)
                        VStack {
                            Image(systemName: "person")
                                
                            Text(i)
                            CheckBoxView(checked:$arr1[i].checked)
                        }
                    }
                }
                ForEach(arr2, id: \.self){i in
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 320, height: 280)
                            .foregroundColor(Color.shadowColor)
                            .shadow(radius: 10)
                        VStack {
                            Image(systemName: "gift")
                                .font(.system(size: 50))
                                .padding(.bottom)
                            Text(i)
                        }
                    }
                }
            }
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
