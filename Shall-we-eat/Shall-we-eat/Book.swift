//
//  Book.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI

struct Book: View {
    @State var username: String = ""
    var body: some View {
        NavigationView {
            List {
                Text("Recipy search")
                    .font(.callout)
                    .bold()
                HStack{
                    TextField("Enter adress of desirable  recipy...", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Image(systemName: "link.badge.plus")
                }
                Section(header: Text("Recently saved")) {
                    ScrollView(.horizontal,
                               showsIndicators: false) {
                        HStack(spacing: 20) {
                            BookRowView()
                            BookRowView()
                            BookRowView()
                        }
                    }
                }
                
                
            }
        }
  }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        Book()
    }
}
