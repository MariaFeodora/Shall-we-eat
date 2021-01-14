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
                    Image(systemName: "magnifyingglass")
                    Text("Recipes")
        }
            BookView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Cook Book")
        }
            Ingredient()
                .tabItem {
                    //Image(systemName: "chart.bar.doc.horizontal.fill")
                    Image(systemName: "list.bullet.rectangle")
                    Text("Ingredient")
        }
            SocialNetworkView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text(" Social")
        }
            Fridge()
                .tabItem {
                    Image(systemName: "dot.circle.and.cursorarrow")
                    Text("Fridge")
        }
    }
        
}
}
