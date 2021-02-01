//
//  Instruction.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI

struct Instruction: View {
    var body: some View {
        ZStack{
        Image("01")
            .resizable()
            .aspectRatio(contentMode: .fill)
        Text("Page 1: Instruction")
            //.position(x: 100, y: 100)
            .font(.largeTitle)
            .foregroundColor(.white)
        } .edgesIgnoringSafeArea(.all)
        .onTapGesture (count: 1) {
            ViewSwitcherState.shared.showNextView()
        }
}
}
struct Instruction_Previews: PreviewProvider {
    static var previews: some View {
        Instruction()
    }
}
