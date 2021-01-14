//
//  BookRowWiew.swift
//  Shall-we-eat
//
//  Created by Mariia Zhurina on 13/01/2021.
//

import Foundation
import SwiftUI

struct BookRowView: View {
    var body: some View {
        HStack {
            Image("Image")
                .resizable()
                .frame(width: 150, height: 150)
            VStack(alignment: .leading) {
                Text("Chicken with potatoes")
                HStack{
                    Text("By: ")
                    Text("Mariia_1992").italic().foregroundColor(.blue)
                }
                Text("Saved 12 min ago").font(.footnote)
            }
            Image(systemName: "ellipsis").foregroundColor(.blue)
        }
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView()
    }
}
