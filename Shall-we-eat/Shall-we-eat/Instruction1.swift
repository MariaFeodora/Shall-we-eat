//
//  Instruction1.swift
//  Shall-we-eat
//
//  Created by Halyna on 30/12/2020.
//

import SwiftUI

struct Instruction1: View {
    var body: some View {
        ZStack{
        Image("03")
            .resizable()
            .aspectRatio(contentMode: .fill)
        Text("Page 2: Instruction")
            //.position(x: 100, y: 100)
            .font(.largeTitle)
            .foregroundColor(.white)
        } .edgesIgnoringSafeArea(.all)
    }
}

struct Instruction1_Previews: PreviewProvider {
    static var previews: some View {
        Instruction1()
    }
}
