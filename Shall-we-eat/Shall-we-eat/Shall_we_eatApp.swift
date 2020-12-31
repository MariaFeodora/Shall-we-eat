//
//  Shall_we_eatApp.swift
//  Shall-we-eat
//
//  Created by Mariia Zhurina on 30/12/2020.
//

import SwiftUI

@main
struct Shall_we_eatApp: App {
    var body: some Scene {
        WindowGroup {
            ViewSwitcher(views: [
                AnyView(ContentView()),
                AnyView(TabBar())
            ])
        }
    }
}


class ViewSwitcherState: ObservableObject {
    @Published var selectedViewIndex = 0
    
    static let shared = ViewSwitcherState()
    
    func showNextView() {
        selectedViewIndex += 1
    }
    func showPreviousView() {
        if selectedViewIndex > 0 {
            selectedViewIndex -= 1
        }
    }
    
    func showView(index: Int) {
        selectedViewIndex = index
    }
}

struct ViewSwitcher: View {
    let views: [AnyView]
    @ObservedObject var switcherState =  ViewSwitcherState.shared
    var body: some View {
         views[switcherState.selectedViewIndex]
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ViewSwitcher(views: [
        AnyView(ContentView()),
            AnyView(TabBar())
        ])
    }
}
