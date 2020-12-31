//
//  Instruction2.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI

struct Instruction2: View {
    
    @State var isDragging = false
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }
    var body: some View {
        ZStack{
            Image("02")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack{
        Text("Page 3: Instruction3")
        Text("Page 3: Instruction3")
            }
        }.onTapGesture (count: 1) {
            ViewSwitcherState.shared.showNextView()
        }
}
}
struct Instruction2_Previews: PreviewProvider {
    static var previews: some View {
        Instruction2()
    }
}
