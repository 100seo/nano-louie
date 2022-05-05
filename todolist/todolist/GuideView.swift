//
//  GuideView.swift
//  todolist
//
//  Created by baek seohyeon on 2022/05/03.
//
import Foundation
import SwiftUI

extension Color {
    static let bgColor = Color("bgColor")
    static let mainColor = Color("mainColor")
    static let pointColor = Color("pointColor")
    static let subColor = Color("subColor")
    static let tabColor = Color("tabColor")
    static let shadowColor = Color("shadowColor")
}


struct GuideView: View {
    
    
    var body: some View {
        ZStack {
            Color.subColor
                .ignoresSafeArea()
            TabView{
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 320, height: 340)
                        .foregroundColor(Color.white)
                        .shadow(radius: 10)
                    VStack {
                        Text("To-do List")
                            .font(.largeTitle)
                            .padding(.bottom,40)
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .padding(.bottom,40)
                        Text("오늘 할 일을 쉽고 빠르게 입력하세요!")
                    }.multilineTextAlignment(.center)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 320, height: 340)
                        .foregroundColor(Color.white)
                        .shadow(radius: 10)
                    VStack {
                        Text("Monthly plan")
                            .font(.largeTitle)
                            .padding(.bottom,40)
                        Image(systemName: "pencil")
                            .font(.system(size: 60))
                            .padding(.bottom,40)
                        Text("월별 계획을 작성하고 관리하세요!")
                    }.multilineTextAlignment(.center)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 320, height: 340)
                        .foregroundColor(Color.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    VStack {
                        Text("Mission")
                            .font(.largeTitle)
                            .padding(.bottom,30)
                        Image(systemName: "flame.fill")
                            .font(.system(size: 60))
                            .padding(.bottom,30)
                        Text("미션을 완료하고 \n 캐릭터 아트를 수집해보세요!")
                    }
                    .multilineTextAlignment(.center)
                }
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
