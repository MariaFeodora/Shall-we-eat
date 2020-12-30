//
//  ContentView.swift
//  Shall-we-eat
//
//  Created by Mariia Zhurina on 30/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let page1 = AnyView(Instruction())
        let page2 = AnyView(Instruction1())
        let page3 = AnyView(Instruction2())
        let pages = [page1, page2, page3]
        MultipageView(pages: pages)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
