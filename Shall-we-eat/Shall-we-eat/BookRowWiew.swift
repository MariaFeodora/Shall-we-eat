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
        VStack {
            Image("Image")
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text("Chicken with potatoes")
                
            }
            
        }
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
        BookRowView()
    }
}
