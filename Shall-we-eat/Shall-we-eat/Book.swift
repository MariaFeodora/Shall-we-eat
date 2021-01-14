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
                    
                        VStack(spacing: 20) {
                            BookRowView()
                            BookRowView()
                            BookRowView()
                        
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        print("See more")
                    }) {
                        
                            Text("See more")
                                    .fontWeight(.semibold)
                                    .font(.title)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.blue)
                                .cornerRadius(8)
                    }
                    Spacer()
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
