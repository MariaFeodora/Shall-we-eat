//
//  Book.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI
struct Item {
    let uuid = UUID()
    let value: String
}
struct BookView: View {
    @State var username: String = ""
    @State private var favoriteColor = 0
    @State private var items = [Item]()
    private var columns: [GridItem] = [
        GridItem(.fixed(150), spacing: 35),
        GridItem(.fixed(150), spacing: 35),
    ]
    var slides = ["Mine", "Want to do", "Done"]
    var body: some View {
        NavigationView {
            ZStack {
            List {
                Text("Adding recepies from other sources")
                    .font(.callout)
                    .bold()
                HStack{
                    TextField("Enter adress of desirable  recipy...", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Image(systemName: "link.badge.plus")
                }
                Section(header: Text("Recently saved")) {
               
                        
                }
                HStack {
                    ScrollView {
                        LazyVGrid(
                            columns: columns,
                            alignment: .center,
                            spacing: 16,
                            pinnedViews: [.sectionHeaders, .sectionFooters]
                        ) {
                            Section {
                                ForEach(0...1, id: \.self) { index in
                                    BookRowView()
                                }
                            }
                        }
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
                VStack {
                    Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                        ForEach(0..<slides.count) { index in
                            Text(self.slides[index]).tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
            }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                        }, label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                        .background(Color.blue)
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                }
            }.navigationTitle("Cook book")
  }
}
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
