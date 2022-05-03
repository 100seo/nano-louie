//
//  CheckBoxView.swift
//  todolist
//
//  Created by baek seohyeon on 2022/05/03.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill":"square")
            .font(.system(size: 25))
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    
    struct CheckBoxViewHolder: View{
        @State var checked = false
        
        var body: some View{
            CheckBoxView(checked: $checked)
        }
    }
    
    
    static var previews: some View {
        CheckBoxViewHolder()
    }
}
