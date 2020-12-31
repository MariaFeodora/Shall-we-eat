//
//  TabBar.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Recipes()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Recipes")
        }
            Book()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Book")
        }
            List()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("List")
        }
            SocialNetwork()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text(" Social")
        }
            Fridge()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Fridge")
        }
    }
        
}
}
