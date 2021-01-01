//
//  Fridge.swift
//  Shall-we-eat
//
//  Created by Halyna on 31/12/2020.
//

import SwiftUI

struct Fridge: View {
    let columns = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    let Ingredients = ["Баклажан", "Кабачок", "Капуста"," Морковь", "Картошка", "Огурцы", "Помидоры", "Чеснок","Лук", "Буряк", "Яйца", "Мука", "Перец","Тыква", "Паста","Рис", "Брокколи", "Редис","Курица", "Говядина","Свинина","Кревкти","Осьминог","Рыба","1","2","3","4","5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    
    var body: some View {
        NavigationView{
        ScrollView {
        VStack {
            LazyVGrid(columns: columns, spacing: 20) {
            ForEach(Ingredients, id: \.self) {
                Ingredients in
                Text(Ingredients)
                    .frame(width: 90, height: 90, alignment: .center)
                    .background(Color.gray)
                    .cornerRadius(30)
            }
        }
            Text("confirm")
                .frame(width: 350, height: 90, alignment: .center)
                .background(Color.gray)
                .cornerRadius(30)
    }
}
        .navigationBarTitle("Выбери 5 продуктов",displayMode: .inline)
        .navigationBarItems(trailing:
                                HStack {
                                    Button("Delete"){}
                                })
}
}
}
struct Fridge_Previews: PreviewProvider {
    static var previews: some View {
        Fridge()
    }
}
