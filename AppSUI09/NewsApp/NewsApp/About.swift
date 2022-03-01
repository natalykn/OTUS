//
//  About.swift
//  NewsApp
//
//  Created by Natalia Andryushina on 2022-03-01.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack{
            Text("Описание/Пошаговая инструкция выполнения домашнего задания:\n\n1. Используйте открытое API https://github.com/public-apis/public-apis \n\n2. Сделайте несколько рубрик по разным запросам новостей или городов по погоде (переключение через горизонтальный ScrollView либо SegmentedControl)\n\n3. При переключении рубрик должен изменять содержимое List, пейджинг должен работать\n\n4. Сделать глубину в 3 экрана с помощью кастомного навигейшен-стека\n\n5. При выборе ячейки на каждом экране(разделе SegmentedControl) сделать анимацию ")
                .font(.callout)
                .frame( maxHeight: .infinity)
        }
        .padding()
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
