//
//  TaskScreen.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-02.
//

import SwiftUI

struct TaskScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                VStack (alignment: .leading, spacing: 20){
                    Text("1. Добавить TabView")
                    Text("2. На втором табе сделать List с обернутый в NavigationView")
                    HStack {
                        Spacer()
                        Text("2.1 Из листа должны быть переходы с NavigationLink")
                        Spacer()
                    }
                    Text("3. На третьем табе должна быть кнопка открывающая модальное окно")
                    Text("4. На первом табе должна быть кнопка открывающая второй таб и один из пунктов там")
                    Text("5. Протестировать на iPad iPhone симуляторах, со сменой ориентации девайса")
                    
                }
                Spacer()
                
            }
            Button("Press to dismiss") {
                dismiss()
            }
            .font(.title)
            .padding()
        }
    }
}

struct TaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskScreen()
            .previewDevice("iPhone 8")
    }
}
